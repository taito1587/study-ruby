class Article < ApplicationRecord
    include PgSearch::Model
  
    # フルテキスト検索の設定
    pg_search_scope :search_by_content, against: [:title, :content], using: {
      tsearch: { prefix: true } # 接頭辞検索を有効にする
    }
  end
