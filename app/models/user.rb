class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  # nameは2文字以上20文字以下
  validates :name, length: { minimum: 2}
  validates :name, length: { maximum: 20}
  # introductionは50文字以下
  validates :introduction, length: { maximum: 50}

  attachment :profile_image

  has_many :books, dependent: :destroy
end
