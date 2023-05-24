module Api
	module V1
		class ProductsController < ApplicationController

			def index
				products = Product.order('created_at DESC')
				render json: {status: 'SUCCESS', message: 'Loaded Products', data: products}, status: :ok
				return
			end

			def show
				product = Product.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Product', data: product}, status: :ok
				return
			end

			def create
				product = Product.new(product_params)
				if product.save
					render json: {status: 'SUCCESS', message: 'Saved Product', data: product}, status: :created
					return
				end

				render json: {status: 'ERROR', message: 'Product Not Saved', data: product.errors},
				status: :unprocessable_entity
			end

			def update
				product = Product.find(params[:id])
				if product.update(product_params)
					render json: {status: "SUCCESS", message: "Updated Product", data: product}, status: :ok
					return
				end
				render json: {status: "ERROR", message: "Product not Updated", data: product}, status: :unprocessable_entity
			end

			def destroy
				product = Product.find(params[:id])
				product.destroy
				render json: {status: "SUCCESS", message: "Deleted Product", data: product}, status: :ok
			end

			private
			def product_params
				params.permit(:name)
			end

		end
	end
end
