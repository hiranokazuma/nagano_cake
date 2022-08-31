class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save!
      flash[:notice] = "You have created a new genre successfully."
      redirect_to admin_genres_path
    else
      flash[:alret] = "You have failed to create a genre."
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
