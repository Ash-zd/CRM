# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope 'api' do
    scope 'chance' do
      post 'new', to: 'chance#new'
      post 'allot', to: 'chance#allot'
      get 'show_all/:user_id', to: 'chance#show_chance'
      get 'no_allot_chance', to: 'chance#show_no_allot_chance'
    end
    scope 'product' do
      post 'new', to: 'product#new'
      get 'destroy/:id', to: 'product#destroy'
      post 'fuzzy_search', to: 'product#fuzzy_search'
      post 'select_search', to: 'product#select_search'
      post 'update', to: 'product#update'
    end
    scope 'expenseAccount' do
      post 'new', to: 'expense_account#new'
      get 'destroy/:id', to: 'expense_account#destroy'
      post 'check', to: 'expense_account#check'
      get 'show/(:all)', to: 'expense_account#show'
    end
    scope 'salePlan' do
      post 'new', to: 'sale_plan#new'
      get 'destroy/:id', to: 'sale_plan#destroy'
      post 'update', to: 'sale_plan#update'
      get 'show', to: 'sale_plan#show'
    end
  end
end
