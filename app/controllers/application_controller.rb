class ApplicationController < ActionController::Base
    before_action :authenticate_user!



    private
    
    def subdivision
        current_user.subdivision
    end
end
