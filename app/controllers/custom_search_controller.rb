class CustomSearchController < ApplicationController
  def find_user_with_profile_title
    p = params[:profile_title].downcase
    # @users = User.all.select{|user| user.profile_title.downcase.include?p}    
    @users = User.where("profile_title LIKE ?", "%" + p + "%").page(params[:page]).order(:created_at)
  end

  def show
    
  end

end
