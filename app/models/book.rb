class Book < ApplicationRecord
  # 投稿が空ならエラー
  validates :title, presence: true
  validates :body, presence: true

  # 入力は200文字以下
  validates :body, length: { maximum: 200}

  belongs_to :user
end
