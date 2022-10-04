class PeopleController < ApplicationController
    
before_action :authorized?
skip_before_action :authorized?, only: [:login]

    def login
        username = params[:username]
        password = params[:password]

        user = Person.where(
            username: username, password: password
        ).first

        if user

            session[:user] = user.id

            render json: {
                message: 'Successfully logged in'
            }, status: :ok
            else
                render json: {
                    message: 'Failed logged in'
                }, status: :unauthorized

    end

    def show
        users = Person.all
        render json: {
            people: users
        }
    end 

    def logout
            sessions.delete :user_id
            render json: {
                message: 'You have been logged out'
            }
    end

    private

    def person_params
        params.permit(:username, :password)
    end

    def authorized?
        return render json: {
            message: 'failed',
            error: 'You are not authorized to view this page'
        }, status: :unauthorized unless session.include? :user
    end
end
