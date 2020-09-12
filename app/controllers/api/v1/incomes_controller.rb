module Api
  module V1
    class IncomesController < ApplicationController
      protect_from_forgery
      def create
        income = Income.new(income_params)
        if income.save
          render json: { status: '201', data: income }
        else
          render json: { status: '401' }
        end
      end

      private

      def income_params
        params.require(:income).permit(:user_id,
                                       :user_group_id,
                                       :salary_date,
                                       :salary_name,
                                       :income_amount)
      end
    end
  end
end
