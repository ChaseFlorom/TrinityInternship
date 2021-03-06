
class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]

  # POST /resource
   def create
    puts "#############################################################################################################################"
     build_resource(sign_up_params)
     resource.fullname = resource.firstname + " " + resource.lastname
     yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
   end
   
    def destroy
        puts "DESTROYED ********************************************************************************************************************************************************************"
        @user = User.find(params[:id])
        @comments = CommentsSubmission.where(user: @user)
        @comments.destroy_all
        @user.destroy
        flash[:danger] = "The user has been deleted."
        redirect_back(fallback_location: root_path)
                
    end    

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
    devise_parameter_sanitizer.permit(:fullname)
   end

end