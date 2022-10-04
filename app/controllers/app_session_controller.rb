class AppSessionController < ApplicationController
    def create
        uid = params[:uid].to_i
        session[:user_id] = uid
        render json: {
            message: 'Create session successfully'
        }
    end

    def create_other
        username = params[:username]
        session[:username] = username
        render json: {
            message: 'Created another session successfully'
        }
        end

    def show
        render json: {
            app_sessions: session
        }
    end
end
