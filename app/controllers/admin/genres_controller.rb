class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save!
      flash[:notice] = "新しいジャンルを登録しました。"
      redirect_to admin_genres_path
    else
      flash[:alret] = "新しいジャンル登録に失敗しました。"
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンル名を変更しました。"
      redirect_to admin_genres_path(@genre)
    else
      flash[:alret] = "ジャンル名の変更に失敗しました。"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
