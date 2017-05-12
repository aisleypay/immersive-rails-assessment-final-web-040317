class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @appearance.user_id = current_user.id
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])

    if @appearance.save
      @appearance.update(appearance_params)
      redirect_to appearance_path(@appearance)
    else
      redirect_to edit_appearance_path(@appearance)
    end
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end
