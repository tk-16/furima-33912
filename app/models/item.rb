class Item < ApplicationRecord
  belongs_to :user
  has_one   :purchase, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :content
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :image
  end

  #validates :name, length: {maximum: 40 }

  with_options presence: true,numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} do
    validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :delivery_fee

  with_options numericality: { other_than: 1 , message: 'Select'} do
    validates :category_id
    validates :condition_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :delivery_fee_id
  end
end