class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :surname, presence: true
  validates :name_kana, presence: true
  validates :surname_kana, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true

end
