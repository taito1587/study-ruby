class ArticlesController < ApplicationController
  def search
    # クエリがあれば検索、なければ全件取得
    @results = Article.search_by_content(params[:query]) if params[:query].present?
    @results ||= Article.all
  end
end

