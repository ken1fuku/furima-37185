class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
#  has_one :shopping

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :day

  #空の投稿を保存できないようにする
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "Category can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "Sales status can't be blank"}
  validates :charge_id, numericality: { other_than: 1 , message: "Shipping fee status can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
  validates :day_id, numericality: { other_than: 1 , message: "Scheduled delivery can't be blank"}

end
