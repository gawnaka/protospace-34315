class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :prototype
has_many :comments  # commentsテーブルとのアソシエーション
validates :password, presence: true
validates :name, :profile, :occupation, :position ,presence: true
 end
