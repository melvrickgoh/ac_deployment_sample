module Api
  module User
    class TransactionsController < ApplicationController
      before_action :authenticate_user!
      
      def index
        render json: current_user.latest_transactions
      end

    end
  end
end