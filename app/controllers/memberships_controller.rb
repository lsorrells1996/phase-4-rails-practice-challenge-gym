class MembershipsController < ApplicationController

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
end
