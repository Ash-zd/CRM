class ProductController < ApplicationController

  def add_product
    new_product = Product.new do |n|
      n.name = params[:name]
      n.category = params[:category]
      n.inventory = params[:inventory]
      n.introduction = params[:introduction]
      n.salesAmount = params[:salesAmount]
      n.marketingKnowledge = params[:marketingKnowledge]
    end
    unless new_product.save
      render :json => {:status => "error" ,:msg => "validates product error"}, :status => 400
    end
    render :json => {:status => "success", :msg => "add product success"}, :status => 200
  end

  def delete_product
    begin
      tmp_product = Product.find_by(id: params[:id])
      if tmp_product == nil || tmp_product ==""
        render :json => {:status => "error", :msg => "couldn't find product "},status => 401
      end
      tmp_product.destroy
      render :json => {:status => "success", :msg => "delete product success"}, :status => 200
    rescue
       render :json => {:status => "error", :msg => "database error" }, :status => 402
    end

  end

  def fuzzy_search
    func = params[:func]
    begin
      tmp_product = Product.where('? LIKE ?',func,"%#{params[:str]}%")
      render :json => tmp_product , :status => 200
    rescue
      render :json => {:status => "error" , :msg => "database error"}, :status => 402
    end
  end

  def select_search
    begin
      tmp_product = Product.where('name = ? and category = ?',params[:name],params[:category])
      render :json => tmp_product, :status => 200
    rescue
      render :json => {:status => "error", :msg => "database error"},:status => 402
    end
  end

  def modify_produce
    begin
      tmp_product = Product.find_by(id: params[:id])
      if tmp_product==nil || tmp_product==""
        render :json => {:status => "error", :msg => "couldn't find product"}, :status => 401
      end
      tmp_product.name = params[:name]
      tmp_product.category = params[:category]
      tmp_product.introduction = params[:introduction]
      tmp_product.marketingKnowledge = params[:marketingKnowledge]
      unless tmp_product.save
        render :json=> {:status => "error", :msg => "validates product error"}, :status => 400
      end
      render :json => {:status => "success", :msg => "modify produce success"}, :status => 200
    rescue
      render :json => {:status => "error", :msg => "database error"},:status => 402
    end
  end

end
