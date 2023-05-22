module Api
	module V1
		class ProductsController < ApplicationController

			def index  # GET ALL
				products = Product.order('created_at DESC')
				render json: {status: 'SUCCESS', message: 'Loaded Products', data: products}, status: :ok
				return
			end

			def show  # GET BY ID
				product = Product.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Product', data: product}, status: :ok
				return
			end

			def create  # CREATE
				product = Product.new(product_params)
				if product.save
					render json: {status: 'SUCCESS', message: 'Saved Product', data: product}, status: :created
					return
				end

				render json: {status: 'ERROR', message: 'Product Not Saved', data: product.errors},
				status: :unprocessable_entity
			end

			def update
				#TODO
			end

			def delete
				#TODO
			end

			private
			def product_params
				params.permit(:name)
			end

		end
	end
end
