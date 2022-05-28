class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations

  with_options presence: true do
    validates :name_first_name,       format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+/} #ひらがなカタカナ漢字
    validates :name_last_name,        format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+/} #ひらがなカタカナ漢字
    validates :name_first_name_kana,  format: { with:/\A[ァ-ヶ一]+\z/} #カタカナのみ
    validates :name_last_name_kana,   format: { with:/\A[ァ-ヶ一]+\z/} #カタカナのみ
    validates :school_id,             numericality: { other_than: 1 ,message: "を選んでください"}
    validates :grade_id,              numericality: { other_than: 1 ,message: "を選んでください"}
    validates :class_id,              numericality: { other_than: 1 ,message: "を選んでください"}
    validates :group_id
    validates :password,              format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} #英数字６字以上。大文字含む。
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  belongs_to :homeroom
  belongs_to :grade
  belongs_to :group

end
