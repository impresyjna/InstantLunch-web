class Api::V1::CustomersController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:update]

  def create
    customer = Customer.new(customer_params)
    if customer.save
      customer.generate_authentication_token!
      render json: customer, status: 201, location: [:api, customer]
    else
      render json: { errors: customer.errors }, status: 422
    end
  end

  def update
    customer = current_user
    if customer.update(customer_params)
      render json: customer, status: 200, location: [:api, customer]
    else
      render json: {errors: customer.errors}, status: 422
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email,:password, :password_confirmation, :login, :name, :surname)
  end
end
