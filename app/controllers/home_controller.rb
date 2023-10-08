class HomeController < ApplicationController
  def index

    # begin 
    #   @u = User.find_by_sql("Select * from users where id=45")
    # rescue => e
    #   byebug
    # end

    # @users = User.all

    #for search bar
    @q = User.ransack(params[:q])
    if params[:q] and params[:q][:city_or_country_cont].present?
      @users = @q.result.page(params[:page]).order(:created_at)
    else
      @users = @q.result.where.not(id: current_user).page(params[:page]).order(:created_at)
    end

    # @tests = User.where.not(id: current_user)
    
  end
end
