class Homeroom < ActiveHash::Base #ここがActiveHash :: Baseの継承
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'A組' },
    { id: 3, name: 'B組' },
    { id: 4, name: 'C組' },
    { id: 5, name: 'D組' },
  ]

  include ActiveHash::Associations
  has_many :user
  
end