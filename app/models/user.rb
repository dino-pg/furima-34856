class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :buys

  with_options presence: true do
  validates :nickname
  validates :email
  validates :encrypted_password, length: { minimum: 6 }
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday
  end
end
