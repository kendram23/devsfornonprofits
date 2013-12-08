class UsersController < ApplicationController
  # load_and_authorize_resource
  # before_filter :authenticate_user!
  # ROLES = %w[admin nonprofit developer]
  # attr_accessible :roles
  before_filter :require_login

  def show
    @user = User.find(params[:id])
  end

  def index
    # authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(params)

    # NEEDS TO REDIRECT TO PAGE DEPENDING ON USER ROLE
    # 
  end

  def edit_details
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      redirect_to @user, :notice => "Settings Saved!"
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def role
    @role = current_user.role
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :github_profile, :twitter_profile, :linkedin_profile, :resume, :about, :picture_url, :company_name, :phone, :city, :state, :zipcode)
  end


  def require_login
    unless current_user
      redirect_to root_path
    end
  end
end