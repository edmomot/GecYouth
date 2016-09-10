class Admin::AdminController < ApplicationController
  before_action :verify_admin

  # GET /admin
  def index
    puts 'in admin controller'
  end

  private

  def verify_admin
    unless current_user.admin?
      flash.alert 'You do not have access to this page'
      redirect_to :root
    end
  end
end