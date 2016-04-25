class ContractsController < ApplicationController

  def show
    @contracts = Contract.find(params[:id])
  end
end
