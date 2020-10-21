class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    before_action :set_locale

    def respond_modal_with(*args, &blk)
      options = args.extract_options!
      options[:responder] = ModalResponder
      respond_with *args, options, &blk
    end


    def set_locale
      I18n.locale = I18n.default_locale
    end

    protected 
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
  end
