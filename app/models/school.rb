class School < ActiveHash::Base #ここがActiveHash :: Baseの継承
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'A教室' },
    { id: 3, name: 'B教室' },
    { id: 4, name: 'C教室' },
    { id: 5, name: 'D教室' },
  ]

  include ActiveHash::Associations
  has_many :user
  
end