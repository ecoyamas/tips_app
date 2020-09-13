module Api
  module V1
    class IncomesController < ApplicationController
      protect_from_forgery
      def create
        income = Income.new(income_params)
        if income.save
          render json: { status: 201, data: income }
        else
          render json: { status: 401, data: income.errors }
        end
      rescue StandardError => e
        logger.error e.backtrace.join("\n")
        render json: { status: 500, data: e.message }
      end

      private

      def income_params
        params.permit(:user_id,
                      :user_group_id,
                      :salary_date,
                      :salary_name,
                      :income_amount)
      end
    end
  end
end
