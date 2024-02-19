class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  has_many :order_items
  has_many :orders, through: :order_items
  validates :meals_name, presence: true
  validates :meals_description, presence: true
  validates :meals_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true

  after_initialize :set_default_price

  private

  def set_default_price
    self.meals_price ||= 0
  end
end
