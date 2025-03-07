# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_timezone
  before_action :set_skin

  private

  def signed_in_root_path(_resource_or_scope)
    shots_path
  end

  def set_timezone
    zone = current_user&.timezone.presence || cookies["browser.timezone"] || "UTC"
    @timezone = ActiveSupport::TimeZone.new(zone)
  end

  def set_skin
    return unless current_user

    @skin = if current_user.skin == "System"
              cookies["browser.colorscheme"].presence
            else
              current_user.skin&.downcase
            end
  end

  def check_admin!
    authenticate_user!
    redirect_to shots_path unless current_user.admin?
  end
end
