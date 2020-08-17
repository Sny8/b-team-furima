class Postage_payer < ActiveHash::Base
  self.data = [
    {id: 1, name: '選択して下さい'}, {id: 2, name: '送料込み(出品者)'}, {id: 3, name: '着払い(購入者)'}
  ]