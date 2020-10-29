class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6}\z/.freeze
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name,          presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters.' } # ここがユーザー本名全角の正規表現
  validates :first_name,         presence: true, format: { with: VALID_NAME_REGEX, message: 'is invalid. Input full-width characters.' } # ここがユーザー本名全角の正規表現
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana,     presence: true, format: { with: VALID_KANA_REGEX , message: 'is invalid. Input full-width katakana characters.' } # ここがフリガナ全角の正規表現
  validates :first_name_kana,    presence: true, format: { with: VALID_KANA_REGEX , message: 'is invalid. Input full-width katakana characters.' } # ここがフリガナ全角の正規表現
  validates :birth_date,         presence: true


  has_many :items
end
