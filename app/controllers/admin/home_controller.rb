class Admin::HomeController < Admin::ApplicationController
  def index
    @stores = Store.where(user: current_user)
  end
end