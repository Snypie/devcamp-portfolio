class PortfoliosController < ApplicationController
	# before_action: set_portfolio_item, only: [:edit, :show, :update, :destroy]
	layout"portfolio"

	def index
		@portfolio_items = Portfolio.all
	end

	def python
		@python_portfolio_items = Portfolio.python
	end

	def new
		@portfolio_item = Portfolio.new
		3.times { @portfolio_item.technologies.build }
	end
		def create
		@portfolio_item = Portfolio.new(portfolio_params)

    	respond_to do |format|
      		if @portfolio_item.save
        		format.html { redirect_to portfolios_path, notice: 'Your Portfolio is now live!' }
      		else
        		format.html { render :new }
      		end
    	end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])

    	respond_to do |format|
      		if @portfolio_item.update(portfolio_params)
        		format.html { redirect_to portfolios_path, notice: 'Your Portfolio was successfully updated!' }
      		else
        		format.html { render :edit }
      		end
    	end
	end

	def show
		@portfolio_item = Portfolio.find(params[:id])	
	end

	def destroy
		@portfolio_item = Portfolio.find(params[:id])
		#perform the lookup

    	@portfolio_item.destroy
    	#destroy the record

    	respond_to do |format| #redirect
      		format.html { redirect_to portfolios_url, notice: 'Record was successfully deleted.' }
    end
	end

	private

	def portfolio_params
	params.require(:portfolio).permit(:title, 
										:subtitle, 
										:body,
										technologies_attributes: [:name]
										)
	end

end
