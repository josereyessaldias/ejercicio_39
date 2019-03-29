class PagesController < ApplicationController
	authorize_resource :class => PagesController
	
  def dashboard
  	@users = User.all
  end

  def change
  	@user = User.find(params[:id])
  	if @user.role == 'admin'
  		@user.role = 'user'
  		@user.save
  	elsif @user.role == 'user'
  		@user.role = 'admin'
  		@user.save
  	end
  	redirect_to pages_dashboard_path
  end

  def erase_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to pages_dashboard_path
  end

  
end
