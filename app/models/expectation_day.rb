class Expection_day < ActiveHash::Base
  self.data = [
    {id: 1, name: '選択してください'}, {id: 2, name: '１〜２日で発送'}, {id: 3, name: '２〜3日で発送'},{id: 4, name: '４〜７日で発送'},
  ]
end