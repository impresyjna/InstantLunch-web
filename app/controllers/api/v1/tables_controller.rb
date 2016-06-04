class Api::V1::TablesController < ApplicationController

  def waiter_call
    table = Table.find_by(QR_code: params[:QR_code])
    table.call = true
    table.save
    head 204
  end

end
