class ProfilesController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
  before_action :set_profile, only: [:show, :edit, :update]
  
  def index
    @profile = Profile.all
  end
  
  def new
    @profile = current_user.build_profile
  end
  
  def create
    @profile = current_user.build_profile(profile_params)
      if @profile.save
        flash[:success] = "profile saved"
        redirect_to root_path
        else
        flash[:error] = "Error"
        render :new
        end
      end
    
  def edit
  end
  
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'profile was successfully updated!'
    else
      render :edit
    end
  end
  
  def after_sign_in_path_for(resource)
  redirect_to edit_user_profile_path
end

  def show
    @profile = Profile.find(params[:id])
  end

  private
  
  def set_profile
    @profile = Profile.find(params[:id])
  end
  
  def profile_params
    params.require(:profile).permit(:bio, :age, :pronouns, :name, :icon)
  end
end
