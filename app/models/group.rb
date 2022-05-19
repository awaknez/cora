class Group < ActiveHash::Base #ここがActiveHash :: Baseの継承
  self.data = [
    { id: 1, name: '生徒・保護者' },
    { id: 2, name: '管理者' },
  ]

  include ActiveHash::Associations
  has_many :user
  
end