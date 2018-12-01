class ProductController < ApplicationController

  def new
    new_product = Product.new do |n|
      n.name = params[:name]
      n.category = params[:category]
      n.inventory = params[:inventory]
      n.introduction = params[:introduction]
      n.sales_amount = params[:sales_amount]
      n.marketing_knowledge = params[:marketing_knowledge]
    end
    unless new_product.save
      return render :json => {:status => "error" ,:msg => new_product.errors.messages}, :status => 400
    end
    render :json => {:status => "success", :msg => "add product success"}, :status => 200
  end

  def destroy
    begin
      tmp_product = Product.find_by(id: params[:id].to_i)
      if tmp_product == nil || tmp_product ==""
        return render :json => {:status => "error", :msg => "couldn't find product "},status => 401
      end
      tmp_product.destroy
      return render :json => {:status => "success", :msg => "delete product success"}, :status => 200
    rescue
       return render :json => {:status => "error", :msg => "database error" }, :status => 402
    end

  end

  def fuzzy_search
    func = params[:func]
    begin
      tmp_product = Product.where(func+' LIKE ?',"%#{params[:str]}%")
      return render :json => {:status => "success", :data => tmp_product} , :status => 200
    rescue
      return render :json => {:status => "error" , :msg => "database error"}, :status => 402
    end
  end

  def select_search
    begin
      tmp_product = Product.where('name = ? and category = ?',params[:name],params[:category])
      render :json => {:status => "success", :data => tmp_product}, :status => 200
    rescue
      render :json => {:status => "error", :msg => "database error"},:status => 402
    end
  end

  def update
    begin
      tmp_product = Product.find_by(id: params[:id].to_i)
      if tmp_product==nil || tmp_product==""
        return render :json => {:status => "error", :msg => "couldn't find product"}, :status => 401
      end
      tmp_product.name = params[:name]
      tmp_product.category = params[:category]
      tmp_product.introduction = params[:introduction]
      tmp_product.marketing_knowledge = params[:marketing_knowledge]
      unless tmp_product.save
        return render :json=> {:status => "error", :msg => tmp_product.errors.messages}, :status => 400
      end
      return render :json => {:status => "success", :msg => "modify produce success"}, :status => 200
    rescue
      return render :json => {:status => "error", :msg => "database error"},:status => 402
    end
  end

end
