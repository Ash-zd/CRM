# frozen_string_literal: true

class SalePlanController < ApplicationController
  def new
    sell_plan = Sell.new do |s|
      s.product_id = params[:product_id]
      s.product_num = params[:product_num]
      s.sale_path = params[:sale_path]
      s.price = params[:price]
      s.sale_expense = params[:sale_expense]
      s.plan_time = params[:plan_time]
    end
    return render json: { status: 'error', msg: sell_plan.errors.messages }, status: :bad_request unless sell_plan.save
    render json: { status: 'success', msg: 'add sell plan success' }, status: :ok
  end

  def update
    sell_plan = Sell.find_by(id: params[:id].to_i)
    if sell_plan.nil? || sell_plan == ''
      return render json: { status: 'error', msg: "couldn't found sell plan" }, status: :bad_request
    end
    sell_plan.product_id = params[:product_id]
    sell_plan.product_num = params[:product_num]
    sell_plan.sale_path = params[:sale_path]
    sell_plan.price = params[:price]
    sell_plan.sale_expense = params[:sale_expense]
    sell_plan.plan_time = params[:plan_time]
    return render json: { status: 'error', msg: sell_plan.errors.messages }, status: :bad_request unless sell_plan.save
    render json: { status: 'success', msg: 'modify sell plan success' }, status: :ok
  rescue StandardError
    render json: { status: 'error', msg: 'database error' }, status: :payment_required
  end

  def destroy
    sell_plan = Sell.find_by(id: params[:id].to_i)
    if sell_plan.nil? || sell_plan == ''
      return render json: { status: 'error', msg: "couldn't found sell plan" }, status: :bad_request
    end
    sell_plan.destroy
    render json: { status: 'success', msg: 'delete sale plan success' }, status: :ok
  rescue StandardError
    render json: { status: 'error', msg: 'database error' }, status: :payment_required
  end

  def show
    sell_plan = Sell.all
    render json: { status: 'success', data: sell_plan }, status: :ok
  rescue StandardError
    render json: { status: 'error', msg: 'database error' }, status: :payment_required
  end
end
