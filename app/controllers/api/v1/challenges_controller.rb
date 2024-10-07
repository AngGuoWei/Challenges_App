module Api
  module V1
    class ChallengesController < ApplicationController
      before_action :set_challenge, only: %i[show update destroy]
      # GET    /api/v1/challenges
      # Can get from rails routes -c challenges
      def index
        #Show all challenges
        @challenges = Challenge.all
        render json: @challenges
      end

      # POST   /api/v1/challenges
      def create
        #Create single challenge
        # Use puts for debugging
        puts params
        challenge = Challenge.new(
          challenges_params
        )

        if challenge.save
          render json: { message: 'Challenge is created successfully', data: challenge }
        else
          render json: { message: 'Failed to add challenge', data: challenge.errors }
        end  
      end

      # GET    /api/v1/challenges/:id
      def show
        # Show single challenge
        if @challenge
          render json: {message: 'Challenge found', data: @challenge}
        else
          render json: {message: 'Challenge not found', data: @challenge.errors}
        end
      end

      # PATCH/PUT  /api/v1/challenges/:id
      def update
        # Update single challenge
        if @challenge.update(challenges_params)
          render json: {message: 'Challenge Updated', data: @challenge}
        else
          render json: {message: 'Challenge not updated', data: @challenge.errors}
        end
      end

      # DELETE /api/v1/challenges/:id
      def destroy
        # Delete single challenge
        if @challenge.destroy
          render json: {message: 'Challenge deleted', data: @challenge}
        else
          render json: {message: 'Challenge not deleted', data: @challenge.errors}
        end
      end

      private

      def set_challenge
        @challenge = Challenge.find(params[:id])
      end

      def challenges_params
        params.require(:challenge).permit(:title, :description, :start_date, :end_date)
      end

    end
  end
end