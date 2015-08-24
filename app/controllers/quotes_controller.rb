class QuotesController < ApplicationController
  before_action :find_quote, only: [:show, :edit, :update]

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.save
      assign_policy
      redirect_to quote_path(@quote)
    else
      flash.now[:error] = "Quote not valid, please try again"
      render action: "new"
    end
  end

  def update
    if @quote.update_attributes(quote_params)
      assign_policy
      redirect_to quote_path(@quote)
    else
      flash.now[:error] = "Quote not valid, please try again"
      render "edit"
    end
  end

  private

  def assign_policy
    @quote.policy = PolicyCalculator.new(@quote).calculate_policy
    @quote.save
  end

  def find_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:age, :trip_days)
  end
end
