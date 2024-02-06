class Order < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    accepts_nested_attributes_for :order_items

    belongs_to :user
end