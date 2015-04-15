#app/controllers/sessions_controller.rb
class SessionController < Devise::DeviseController

    def after_sign_in_path_for(resource)
        if resource.sign_in_count == 1
           new_post_path
        else
           root_path
        end
    end

end