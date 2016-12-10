module Api
  module User
    class ShoppingCartController < ApplicationController
      before_action :authenticate_user!
      
      def index
        render json: current_user.shopping_cart
      end

      def add_items
        if update_cart_params[:item_ids].present? && valid_item_ids
          current_user.shopping_cart_add_items(update_cart_params[:item_ids])
          render json: current_user.shopping_cart
        else
          render json: { error: "Invalid input" }
        end
      end

      def remove_items
        if update_cart_params[:item_ids].present? && valid_item_ids
          current_user.shopping_cart_remove_items(update_cart_params[:item_ids])
          render json: current_user.shopping_cart
        else
          render json: { error: "Invalid input" }
        end
      end

      def destroy
        current_user.shopping_cart_empty
        render json: { success: true }
      end

      private

      def update_cart_params
        params.require(:shopping_cart).permit(item_ids: [])
      end

      def valid_item_ids
        (update_cart_params[:item_ids].detect { |id| !id.is_a?(Integer) }).nil?
      end

    end
  end
end