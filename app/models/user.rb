class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,           presence: true
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6}\z/
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX}
  validates :last_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' } # ここがユーザー本名全角の正規表現
  validates :first_name,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' } # ここがユーザー本名全角の正規表現
  validates :last_name_kana,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.'} # ここがフリガナ全角の正規表現
  validates :first_name_kana,    presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } # ここがフリガナ全角の正規表現
  validates :birth_date,         presence: true
end
