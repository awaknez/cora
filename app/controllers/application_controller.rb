class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:school_id,:class_id,:grade_id,:name_last_name, :name_first_name, :name_last_name_kana, :name_first_name_kana,:group_id])
  end
end
