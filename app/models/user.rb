class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  #belongs_to :user
  #has_many :prototype_users
 # has_many :prototype, through: :prototype_users
  has_many :prototype
  has_many :comments  # commentsテーブルとのアソシエーション
  validates :password, presence: true
  validates :name, presence: true
  validates :occupation, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
   
 end
