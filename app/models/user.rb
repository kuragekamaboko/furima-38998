

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_ZENNKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :name, presence: true, format: { with: VALID_ZENNKAKU_REGEX, allow_blank: true}
  validates :surname, presence: true, format: { with: VALID_ZENNKAKU_REGEX, allow_blank: true}
  validates :name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true}
  validates :surname_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true}
  validates :birthday, presence: true

  validates :password, format: { with: VALID_PASSWORD_REGEX}

end
