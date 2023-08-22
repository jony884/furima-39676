class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :shipping_origin
  belongs_to :days_to_ship

  validates :category_id, 
            presence: { message: "カテゴリーを選択してください" }, 
            numericality: { other_than: 1, message: "カテゴリーを選択してください" }

  validates :item_condition_id, 
            presence: { message: "商品の状態を選択してください" }, 
            numericality: { other_than: 1, message: "商品の状態を選択してください" }

  validates :shipping_cost_id, 
            presence: { message: "配送料の負担を選択してください" }, 
            numericality: { other_than: 1, message: "配送料の負担を選択してください" }

  validates :shipping_origin_id, 
            presence: { message: "発送元の地域を選択してください" }, 
            numericality: { other_than: 1, message: "発送元の地域を選択してください" }

  validates :days_to_ship_id, 
            presence: { message: "発送までの日数を選択してください" }, 
            numericality: { other_than: 1, message: "発送までの日数を選択してください" }

  validates :item_name, 
            presence: { message: "商品名を入力してください" },
            length: { maximum: 40, message: "商品名は40文字以下で入力してください" }

  validates :item_description, 
            presence: { message: "商品の説明を入力してください" },
            length: { maximum: 1000, message: "商品の説明は1000文字以下で入力してください" }

  validates :price, 
            presence: { message: "価格を入力してください" },
            numericality: { 
              greater_than_or_equal_to: 300, 
              less_than_or_equal_to: 999999, 
              message: "価格は300以上999999以下で設定してください" 
            }

  validates :image, presence: { message: "商品画像を選択してください" }

end
