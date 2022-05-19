class Style < ActiveHash::Base #ここがActiveHash :: Baseの継承
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '対面' },
    { id: 3, name: 'オンライン(zoom)' },
  ]

  include ActiveHash::Associations
  has_many :reservations
  
end