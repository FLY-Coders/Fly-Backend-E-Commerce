module Api
	module V1
		class ProductsController < ApplicationController
			def index
				products = Product.order('created_at DESC')
				render json: {status: 'SUCCESS', message: 'Loading Products', data: products}, status_code: :ok
			end

			def create
			end

			def update
			end

			def delete
			end
		end
	end
end

