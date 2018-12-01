class SellController < ApplicationController
  def add_chance
    new_chance = Chance.new do |c|
      c.client_id = params[:client_id]
      c.content = params[:content]
      c.user_id = nil
    end
    unless new_chance.save
      render :json => {:status => "error" ,:msg => "validates chance error"}, :status => 400
    end
    render :json => {:status => "success", :msg => "add chance success"}, :status => 200
  end

  def allot_chance
    begin
      tmp_chance = Chance.find_by(id: params[:id])
      if tmp_chance ==nil || tmp_chance ==""
        render :json => {:status => "error", :msg => "couldn't find chance "},status => 401
      else
        unless tmp_chance.update(user_id: params[:user_id])
          render :json => {:status => "error" ,:msg => "validates user_id error"}, :status => 400
        end
        render :json => {:status => "success", :msg => "allot chance success"}, :status => 200
      end
    rescue
      render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end

  def show_chance
    begin
      chance = Chance.where(user_id: params[:user_id])
      render :json => chance , :status => 200
    rescue
      render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end

  def show_no_allot_chance
    begin

    rescue
    end

  end
end
