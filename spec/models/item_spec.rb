require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'nameとdescription、priceとimage、category_idとstatus_id、charge_idとarea_id、day_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下の場合は保存できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of range')
      end
      it 'priceが10,000,000以上の場合は保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of range')
      end
      it 'priceが半角数値ではない場合は登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of range')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idの選択が「--」の時は保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idの選択が「--」の時は保存できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'charge_idの選択が「--」の時は保存できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'area_idの選択が「--」の時は保存できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'day_idの選択が「--」の時は保存できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'ユーザー情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
