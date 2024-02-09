class Order < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    accepts_nested_attributes_for :order_items

    belongs_to :user

    validate :at_least_one_meal_ordered, on: :create

    private

    def at_least_one_meal_ordered
        if order_items.none? { |item| item.quantity.positive? }
          errors.add(:base, 'At least one meal must be ordered')
        end
    end
end