class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    def index
        m = Membership.all
        render json: m
    end

    def create
        m = Membership.create!(m_params)
        render json: m, status: :created 
    end

    private

    def m_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
end
