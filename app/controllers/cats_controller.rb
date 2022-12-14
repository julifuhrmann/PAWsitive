class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @cats = Cat.search_by_name_and_age(params[:query])
    else
      @cats = Cat.all
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @booking = Booking.new
  end

  def my_cats
    @cats = Cat.where(user: current_user)
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    @cat.save
    redirect_to cats_path(@cat)
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    redirect_to cat_path(@cat)
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to cats_path, status: :see_other
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :description, :status, :photo)
  end
end
