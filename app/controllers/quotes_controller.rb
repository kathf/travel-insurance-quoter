class QuotesController < ApplicationController
  before_action :find_quote, only: [:show]

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create(quote_params)
    @quote.policy = assign_policy
    if @quote.save
      redirect_to quote_path(@quote)
    else
      flash.now[:error] = "Quote not valid, please try again"
      render action: "new"
    end
  end

  def show; end

  private

  def assign_policy
    PolicyCalculator.new(@quote).calculate_policy
  end

  def find_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:age, :trip_days)
  end
end
