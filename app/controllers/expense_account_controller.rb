class ExpenseAccountController < ApplicationController

  def new
    new_expense_account = ExpenseAccount.new do |e|
      e.order_id = params[:order_id]
      e.order_money = params[:order_money]
      e.expense_id =  current_user.id #params[:expense_id].to_i # use current_user.id
      e.review_comment = nil
      e.reviewer_id = nil
    end

    unless new_expense_account.save
      return render :json => {:status => "error" ,:msg => new_expense_account.errors.messages}, :status => 400
    end
    render :json => {:status => "success", :msg => "add expense account success"}, :status => 200

  end

  def check
    unless current_user.role == ""
      return render :json => {:status => "error", :msg => "permission_denied"}, :status => 400
    end
    begin
      tmp_expense_account = ExpenseAccount.find_by(id: params[:id].to_i)
      if tmp_expense_account == nil || tmp_expense_account == ""
        return render :json => {:status => "error", :msg => "couldn't found expense account"}, :status => 400
      end
      if current_user.id == tmp_expense_account.expense_id
        return render :json => {:status => "error", :msg => "expense_id , reviewer_id is same"}, :status =>403
      end

      unless tmp_expense_account.update(review_comment: params[:review_comment],reviewer_id: current_user.id)
        return render :json => {:status => "error" ,:msg => tmp_expense_account.errors.messages}, :status => 400
      end
      return render :json => {:status => "success", :msg => "check expense account success"}, :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end

  def destroy
    unless current_user == ""
      return render :json => {:status => "error", :msg => "permission_denied"}, :status => 400
    end
    begin
      tmp_expense_account = ExpenseAccount.find_by(id: params[:id].to_i)
      if tmp_expense_account == nil || tmp_expense_account == ""
        return render :json => {:status => "error", :msg => "couldn't found expense account"}, :status => 400
      end

      tmp_expense_account.destroy
      return render :json => {:status => "success", :msg => "delete expense account success"}, :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end

  def show
    begin
      unless params[:all] == "all"
        expense_account = ExpenseAccount.where('reviewer_id is null')
        return render :json => {:status => "success", :data => expense_account}, :status => 200
      end
      expense_account = ExpenseAccount.all
      return render :json => {:status => "success", :data => expense_account}, :status =>200
    rescue
      return render :json => {:status => "error", :msg => "database error" }, :status => 402
    end
  end
end
