##usersテーブル

|column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false, unique:true|
|password|string|null:false|
###Association
- has_one:profile, dependent::destroy
- has_one:point, dependent::destroy
- has_many:user_evalutions
- has_many:buyer_products, class_name:products
- has_many:seller_products, class_name:products
- has_many:comments,dependent::destroy
- has_many:likes,dependent::destroy
- has_many:sns_authentications, dependent::destroy
- has_many:credit_cards, dependent::destroy

##profileテーブル
|column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|
|introduction|text|
|avatar|string|
|user_id|references|null:false, foreign_key:true|
###Association
- belongs_to:user

##User_Evaluationsテーブル
|column|Type|Options|
|------|----|-------|
|evaluations|references|null:false, foreign_key:true|
|product_id|references|null:false, foreign_key:true|
|user_id|references|null:false, foreign_key:true|
|review|string|null:false|
###Association
- belongs_to_active_hash:evaluation
- belongs_to:product
- belongs_to:user

##Productsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null:false|
|price|integer|null:false|
|condition|references|null:false, foreign_key:true|
|brand|references|null:false, foreign_key:true|
|seller_user|references|null:false, foreign_key:true|
|buyer_user|references|null:false, foreign_key:true|
|status|references|null:false, foreign_key:true|
|postage_payer|references|null:false, foreign_key:true|
|expection_day|references|null:false, foreign_key:true|
|deal_finish_day|date|null:false|
|prefecture_code|integer|null:false|
###Association
- has_many:comments, dependent::destroy
- has_mamy:products_images
- belongs_to :seller_user, class_name: 'User', foreign_key:seller_id
- belongs_to :buyer_user, class_name: 'User', foreign_key:buyer_id
- belongs_to:brand
- belongs_to:category
- belongs_to_active_hash:condition
- belongs_to_active_hash:status
- belongs_to_active_hash:postage_payer
- belongs_to_active_hash:expectation_day
*Gem：jp_prefecture

##Product_Imageテーブル
|column|Type|Options|
|------|----|-------|
|url|string|null:false|
|product_id|references|null:false, foreign_key: true|
###Association
- belongs_to:product

##Destinationテーブル
|column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|post_code|integer|null:false|
|prefecture_code|integer|null:false|
|city|string|null:false|
|block|integer|null:false|
|building|string|
|phone_number|intger|
|user_id|references|null:false, foreign_key:true|
###Association
- belongs_to:user
*Gem：jp_prefecture

##Categoriesテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|
###Association
- has_many :products

##Brandsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null:false|
###Association
- has_many :products

##Todosテーブル
|column|Type|Options|
|------|----|-------|
|text|string|null:false|
|user_id|references|null:false, foreign_key: true|
###Association
- belongs_to :user

##Likesテーブル
|column|Type|Options|
|------|----|-------|
|product_id|references|null:false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|
###Association
- belongs_to :user
- belongs_to :product

##commentsテーブル
|column|Type|Options|
|------|----|-------|
|comment|string|null:false|
|user_id|references|null:false, foreign_key: true|
|product|references|null:false, foreign_key: true|
###Association
- belongs_to:user
- belongs_to:product

##Pointsテーブル
|column|Type|Options|
|------|----|-------|
|point|integer|null:false|
|user_id|references|null:false, foreign_key: true|
###Association
- belongs_to:user

##Sns_Authenticationsテーブル
|column|Type|Options|
|------|----|-------|
|provider|string|null:false|
|uid|integer|null:false, unique:true|
|user_id|references|null:false,foreign_key:true|
###Association
- belongs_to :user

##credit_cardsテーブル
|column|Type|Options|
|------|----|-------|
|card_number|integer|null:false,unique:true|
|expiration_year|year|null:false|
|expiration_month|date|null:false|
|security_code|integer|null:false,unique:true|
|user_id|references|null:false, foreign_key: true|
###Association
- belongs_to:user



# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
