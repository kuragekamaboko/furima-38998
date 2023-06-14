VALID_ZENNKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true


  validates :name, presence: true, format: { with: VALID_ZENNKAKU_REGEX, allow_blank: true}
  validates :surname, presence: true, format: { with: VALID_ZENNKAKU_REGEX, allow_blank: true}
  validates :name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true}
  validates :surname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true}
  validates :encrypted_password, presence: true
  validates :birthday, presence: true

  validates :password, format: { with: VALID_PASSWORD_REGEX, allow_blank: true}

end