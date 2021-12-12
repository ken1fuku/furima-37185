class Address < ApplicationRecord
  belongs_to :shopping

  # 数字3桁、ハイフン、数字4桁の並びのみ許可する
  # validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # 1以外の整数を許可する
  # validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
end
