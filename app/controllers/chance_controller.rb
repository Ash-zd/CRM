class ChanceController < ApplicationController
  def new
    new_chance = Chance.new do |c|
      c.client_id = params[:client_id]
      c.content = params[:content]
      c.user_id = nil
    end
    unless new_chance.save
      return render :json => {:status => "error" ,:msg => new_chance.errors.messages}, :status => 400
    end
    render :json => {:status => "success", :msg => "add chance success"}, :status => 200
  end

  def allot
    begin
      tmp_chance = Chance.find_by(id: params[:id].to_i)
      if tmp_chance ==nil || tmp_chance ==""
        return render :json => {:status => "error", :msg => "couldn't find chance "},status => 401
      else
        unless tmp_chance.update(user_id: params[:user_id].to_i)
          return render :json => {:status => "error" ,:msg => tmp_chance.errors.messages}, :status => 400
        end
        return render :json => {:status => "success", :msg => "allot chance success"}, :status => 200
      end
    rescue
      return render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end

  def show_chance
    begin
      chance = Chance.where(user_id: params[:user_id].to_i)
      return render :json => {:status => "success", :data => chance} , :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end

  def show_no_allot_chance
    begin
      chance = Chance.where("user_id is null")
      return render :json => {:status => "success", :data => chance} , :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end


end
