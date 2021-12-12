require 'rails_helper'

RSpec.describe ShoppingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @shopping_address = FactoryBot.build(:shopping_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shopping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @shopping_address.building_name = ''
        expect(@shopping_address).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @shopping_address.postal_code = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shopping_address.postal_code = '1234567'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @shopping_address.area_id = 1
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @shopping_address.municipalities = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @shopping_address.house_number = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @shopping_address.telephone_number = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以内の半角数値では保存できないこと' do
        @shopping_address.telephone_number = '123456789'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが12桁以上の半角数値では保存できないこと' do
        @shopping_address.telephone_number = '123456789012'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが10桁以上11桁以内の全角数値では保存できないこと' do
        @shopping_address.telephone_number = '１２３４５６７８９０'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @shopping_address.user_id = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @shopping_address.item_id = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @shopping_address.token = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
