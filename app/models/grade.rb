class Grade < ActiveHash::Base #ここがActiveHash :: Baseの継承
  self.data = [
    { id:  1, name: '--' },
    { id:  2, name: '高卒以上'  },
    { id:  3, name: '高校3年生' },
    { id:  4, name: '高校2年生' },
    { id:  5, name: '高校1年生' },
    { id:  6, name: '中学3年生' },
    { id:  7, name: '中学2年生' },
    { id:  8, name: '中学1年生' },
    { id:  9, name: '小学6年生' },
    { id: 10, name: '小学5年生' },
    { id: 11, name: '小学4年生' },
    { id: 12, name: '小学3年生' },
    { id: 13, name: '小学2年生' },
    { id: 14, name: '小学1年生' },

  ]

  include ActiveHash::Associations
  has_many :user
  
end