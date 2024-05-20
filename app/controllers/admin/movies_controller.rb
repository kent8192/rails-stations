module Admin
  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def new
      @movies = Movie.all
    end

    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to 'admin/movies', notice: '映画が正常に作成されました。'
      else
        flash.now[:alert] = '映画の作成に失敗しました。'
        render :new
      end
    end

    def edit
      @movie = Movie.find_by(id: params[:id])
    end

    def update
      @movie = Movie.find_by(id: params[:id])
      @movie.update(movie_params)
      redirect_to '/admin/movies'
    end

    def destroy
      @movie = Movie.find_by(id: params[:id])
      raise ActiveRecord::RecordNotFound unless @movie

      @movie.destroy
      redirect_to '/admin/movies', notice: '映画の削除が完了しました。'
    end

    private

    def movie_params
      params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end
  end
end
