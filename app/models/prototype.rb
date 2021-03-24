class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :text, presence: true
  belongs_to :user

  def was_attached?
    self.image.attached?
  end
end
