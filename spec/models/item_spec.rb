require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      # @item.image = fixture_file_upload(Rails.root.join('spec', 'images', 'Test.jpg'), 'image/jpeg')
    end

    describe '商品出品' do
      context '出品できる場合' do
        it '必要事項を全て過不足なく入力すると登録できる' do
          item = FactoryBot.build(:item) 
          expect(item).to be_valid
        end
      end
      context '出品できない場合' do
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
  
        it 'item_nameが空では登録できないこと' do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end

        it 'item_nameが41文字以上だと登録できないこと' do
          @item.item_name = 'a' * 41
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
        end
  
        it 'item_descriptionが空では登録できないこと' do
          @item.item_description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description can't be blank")
        end

        it 'item_descriptionが1001文字以上だと登録できないこと' do
          @item.item_description = 'a' * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description is too long (maximum is 1000 characters)")
        end
    
  
        it 'category_idが空では登録できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
  
        it 'item_condition_idが空では登録できないこと' do
          @item.item_condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition can't be blank")
        end
  
        it 'shipping_cost_idが空では登録できないこと' do
          @item.shipping_cost_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
        end
  
        it 'shipping_origin_idが空では登録できないこと' do
          @item.shipping_origin_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
        end
  
        it 'days_to_ship_idが空では登録できないこと' do
          @item.days_to_ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship can't be blank")
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
    
        it 'priceが299円以下では登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
    
        it 'priceが1000000円以上では登録できないこと' do
          @item.price = 1000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 999999")
        end
      end
    end
  end
end