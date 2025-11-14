class AddPgSearchIndexToArticles < ActiveRecord::Migration[8.1]
  def up
    # pg_searchのマルチ検索インデックスを追加
    # titleとcontentカラムに対してフルテキスト検索インデックスを作成
    add_index :articles, 
              "to_tsvector('english', coalesce(title, '') || ' ' || coalesce(content, ''))",
              using: :gin,
              name: 'index_articles_on_title_content_search'
  end

  def down
    remove_index :articles, name: 'index_articles_on_title_content_search'
  end
end
