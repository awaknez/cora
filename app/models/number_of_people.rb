class NumberOfPeople < ActiveHash::Base #ここがActiveHash :: Baseの継承
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '保護者のみ' },
    { id: 3, name: '生徒＋保護者1名' },
    { id: 4, name: '生徒＋保護者2名' },
    { id: 5, name: '生徒＋保護者3名以上' },
  ]

  include ActiveHash::Associations
  has_many :reservations
  
end