class User < ActiveRecord::Base
  include Authority::UserAbilities
  rolify
  has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def show
   	@user = User.find(params[:id])
   end

   def index
   	@users = User.all
   end

   def new
   	@user = User.new
   end

   def create
   	@user = User.create(params)

   	# NEEDS TO REDIRECT TO PAGE DEPENDING ON USER ROLE
   	redirect_to
   end

   def edit
   	@user = User.find(params[:id])
   end

   def update
   	@user = User.find(params[:id])
   	@user.update(params)

   	# NEEDS TO REDIRECT TO PAGE DEPENDING ON USER ROLE
   	redirect_to
   end

   def destroy
   	@user = User.find(params[:id])
   	@user.destroy

   	# NEEDS TO REDIRECT TO PAGE DEPENDING ON USER ROLE

   	redirect_to
   end

end
