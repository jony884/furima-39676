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
          expect(@item.errors.full_messages).to include("Image 商品画像を選択してください")
        end
  
        it 'item_nameが空では登録できないこと' do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name 商品名を入力してください")
        end

        it 'item_nameが41文字以上だと登録できないこと' do
          @item.item_name = 'a' * 41
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name 商品名は40文字以下で入力してください")
        end
  
        it 'item_descriptionが空では登録できないこと' do
          @item.item_description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description 商品の説明を入力してください")
        end

        it 'item_descriptionが1001文字以上だと登録できないこと' do
          @item.item_description = 'a' * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include("Item description 商品の説明は1000文字以下で入力してください")
        end
    
  
        it 'category_idが空では登録できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category カテゴリーを選択してください")
        end

        it "・・・カテゴリーの情報は1以外でないと登録できない" do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category カテゴリーを選択してください")
          end
          
        it 'item_condition_idが空では登録できないこと' do
          @item.item_condition_id = nil
          @item.valid?          
          expect(@item.errors.full_messages).to include("Item condition 商品の状態を選択してください")
        end

        it "・・・商品の状態の情報は1以外でないと登録できない" do
          @item.item_condition_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition 商品の状態を選択してください")
          end
          
  
        it 'shipping_cost_idが空では登録できないこと' do
          @item.shipping_cost_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost 配送料の負担を選択してください")
        end

        it "・・・配送料の負担の情報は1以外でないと登録できない" do
          @item.shipping_cost_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost 配送料の負担を選択してください")
          end
          
  
        it 'shipping_origin_idが空では登録できないこと' do
          @item.shipping_origin_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping origin 発送元の地域を選択してください")
        end

        it "・・・発送元の地域の情報は1以外でないと登録できない" do
          @item.shipping_origin_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping origin 発送元の地域を選択してください")
          end
  
        it 'days_to_ship_idが空では登録できないこと' do
          @item.days_to_ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship 発送までの日数を選択してください")
        end

        it "・・・発送までの日数は1以外でないと登録できない" do
          @item.days_to_ship_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship 発送までの日数を選択してください")
          end
          

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 価格を入力してください")
        end
    
        it 'priceが299円以下では登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 価格は半角数字のみで入力してください")
        end

        it 'priceが全角数字では登録できないこと' do
          @item.price = '９９９'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 価格は半角数字のみで入力してください")
        end
        
    
        it 'priceが1000000円以上では登録できないこと' do
          @item.price = 1000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price 価格は半角数字のみで入力してください")
        end


        it 'userが紐づいていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
        
      end
    end
  end
end