class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.order(:email)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    # Don't change password if admin doesn't change the text
    if params[:user][:password].empty?
      params[:user].delete(:password)
    end
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end
  
end

