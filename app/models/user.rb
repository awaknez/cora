class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :school
  belongs_to :homeroom
  belongs_to :grade
  belongs_to :group

end
