class SellController < ApplicationController
  def add_chance
    tmp_chance = Chance.new do |t|
      t.user_id = params[:user_id]
      t.chance_context = params[:chance_context]
    end
    unless tmp_chance.save
      render :json => {:status => "error", :msg => "validates chance error"}, :status => 400
    end
    render :json => {:status => "success", :msg => "add chance success"}, :status => 200
  end

  def add_sell
    tmp_sell = Sell.new do |t|
      t.plan_time = params[:plan_time]
      t.plan_content = params[:plan_content]
      t.chance_id = params[:chance_id]
    end
  end
end
