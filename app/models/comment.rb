class Comment < ApplicationRecord
  belongs_to :prototype  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  # has_one_attached :image
  # has_many :comments
  # has_many :commnets, dependent: :destroy
 
  def was_attached?
    self.image.attached?
  end
end
