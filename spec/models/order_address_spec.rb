require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @order_address.postal_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal number can't be blank")
    end
    it '都道府県が空だと保存できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町が空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号には-がないと保存できないこと' do
      @order_address.postal_number = 1_234_567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal number is invalid. Include hyphen(-)')
    end
    it '電話番号には-があると保存できないこと' do
      @order_address.phone_number = 123 - 4564 - 7890
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number does not require a hyphen and must be within 11 digits')
    end
    it '電話番号は11桁以下でないと保存できないこと' do
      @order_address.phone_number = 111_111_111_111
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number does not require a hyphen and must be within 11 digits')
    end
    it '電話番号は数字のみでないと保存できないこと' do
      @order_address.phone_number = 'abcdefghij'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number does not require a hyphen and must be within 11 digits')
    end
    it 'user_idが空だと保存できないこと' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
