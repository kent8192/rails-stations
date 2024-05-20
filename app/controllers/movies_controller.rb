class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    keyword = params[:keyword]
    return unless keyword

    @movies = search_movies(params)
  end

  def search_movies(params)
    movies_table = Movie.arel_table
    conditions = []

    # キーワードによる検索条件
    if params[:keyword].present?
      keyword = params[:keyword]
      title_match = movies_table[:name].matches("%#{keyword}%")
      description_match = movies_table[:description].matches("%#{keyword}%")
      conditions << title_match.or(description_match)
    end

    # 上映状態による検索条件
    case params[:movie]
    when 'is_showing'
      conditions << movies_table[:is_showing].eq(true)
    when 'is_not_showing'
      conditions << movies_table[:is_showing].eq(false)
    end

    # 条件を組み合わせて検索
    Movie.where(conditions.reduce(:and))
  end
end
