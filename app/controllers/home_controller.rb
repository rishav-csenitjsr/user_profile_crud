class HomeController < ApplicationController
    before_action :authenticate_user_profile!, except: [:index]
    def index
        
    end
end
