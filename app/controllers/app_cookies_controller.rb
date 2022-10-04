class AppCookiesController < ApplicationController
    
    def create
        data = params[:data]
        cookies[:info] = data
        render json: {
            message: "Cookie has been create!"
        }
    end

    def create_other
        data = params[:data]
        # Setting the cookies
        cookies[:other_info] = data
        render json: {
            message: "Other Cookies have been create!"
        }
    end

    def destroy_cookie
        cookies.delete :other_info
        render json: {
            message: "Other Cookies have been deleted!"
        }
    end

    def show
        render ison: {
            app_cookies: cookies
        }
    end
end
