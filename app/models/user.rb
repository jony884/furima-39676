class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :buys

  validates :nick_name, presence: true
  validates :email
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,}\z/, message: "は英字と数字を含む6文字以上で設定してください" }
  validates :family_name_kanji, format: { with: /\A[一-龯ぁ-んァ-ンー－]+\z/, message: "は漢字、カタカナ、ひらがなのみで入力してください" }
  validates :personal_name_kanji, format: { with: /\A[一-龯ぁ-んァ-ンー－]+\z/, message: "は漢字、カタカナ、ひらがなのみで入力してください" }
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナのみで入力してください" }
  validates :personal_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナのみで入力してください" }
  validates :birthdate,presence: true

end
