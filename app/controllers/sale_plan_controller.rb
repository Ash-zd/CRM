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
    unless sell_plan.save
      return render :json => {:status => "error" ,:msg => sell_plan.errors.messages}, :status => 400
    end
    render :json => {:status => "success", :msg => "add sell plan success"}, :status => 200
  end

  def update
    begin
      sell_plan = Sell.find_by(id: params[:id].to_i)
      if sell_plan == nil || sell_plan == ""
        return render :json => {:status => "error", :msg => "couldn't found sell plan"},:status => 400
      end
      sell_plan.product_id = params[:product_id]
      sell_plan.product_num = params[:product_num]
      sell_plan.sale_path = params[:sale_path]
      sell_plan.price = params[:price]
      sell_plan.sale_expense = params[:sale_expense]
      sell_plan.plan_time = params[:plan_time]
      unless sell_plan.save
        return render :json => {:status => "error" ,:msg => sell_plan.errors.messages}, :status => 400
      end
      return render :json => {:status => "success", :msg => "modify sell plan success"}, :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error"},:status => 402
    end
  end

  def destroy
    begin
      sell_plan = Sell.find_by(id: params[:id].to_i)
      if sell_plan == nil || sell_plan == ""
        return render :json => {:status => "error", :msg => "couldn't found sell plan"},:status => 400
      end
      sell_plan.destroy
      render :json => {:status => "success", :msg => "delete sale plan success"}, :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error"},:status => 402
    end
  end

  def show
    begin
      sell_plan = Sell.all
      render :json => {:status => "success", :data => sell_plan}, :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error"},:status => 402
    end
  end
end
