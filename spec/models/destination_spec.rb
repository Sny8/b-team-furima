require 'rails_helper'

describe Destination do
  describe '#create_destination' do

    it "first_nameとfamily_name、first_nama_kanaとfamily_name_kana、post_codeとprefecture_code、cityとblockが存在すれば登録できること" do
      destination = build(:destination)
      expect(destination).to be_valid
    end

    it "first_nameがない場合は登録できないこと" do
      destination = build(:destination, first_name: nil)
      destination.valid?
      expect(destination.errors[:first_name]).to include("を入力してください")
    end

    it "family_nameがない場合は登録できないこと" do
      destination = build(:destination, family_name: nil)
      destination.valid?
      expect(destination.errors[:family_name]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      destination = build(:destination, first_name_kana: nil)
      destination.valid?
      expect(destination.errors[:first_name_kana]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      destination = build(:destination, family_name_kana: nil)
      destination.valid?
      expect(destination.errors[:family_name_kana]).to include("を入力してください")
    end

    it "post_codeがない場合は登録できないこと" do
      destination = build(:destination, post_code: nil)
      destination.valid?
      expect(destination.errors[:post_code]).to include("を入力してください")
    end

    it "prefecture_codeがない場合は登録できないこと" do
      destination = build(:destination, prefecture_code: nil)
      destination.valid?
      expect(destination.errors[:prefecture_code]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      destination = build(:destination, city: nil)
      destination.valid?
      expect(destination.errors[:city]).to include("を入力してください")
    end

    it "blockがない場合は登録できないこと" do
      destination = build(:destination, block: nil)
      destination.valid?
      expect(destination.errors[:block]).to include("を入力してください")
    end

    it "first_nameが半角の場合は登録できないこと" do
      destination = build(:destination, first_name: "ﾏｻﾄ")
      destination.valid?
      expect(destination.errors[:first_name]).to include("は不正な値です")
    end

    it "family_nameが半角の場合は登録できないこと" do
      destination = build(:destination, family_name: "tanaka")
      destination.valid?
      expect(destination.errors[:family_name]).to include("は不正な値です")
    end

    it "first_nameが全角数字の場合は登録できないこと" do
      destination = build(:destination, first_name: "１２３４５")
      destination.valid?
      expect(destination.errors[:first_name]).to include("は不正な値です")
    end

    it "family_nameが全角数字の場合は登録できないこと" do
      destination = build(:destination, family_name: "１２３４５田中")
      destination.valid?
      expect(destination.errors[:family_name]).to include("は不正な値です")
    end
    
    it "first_name_kanaが半角の場合は登録できないこと" do
      destination = build(:destination, first_name_kana: "ﾏｻﾄ")
      destination.valid?
      expect(destination.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが半角の場合は登録できないこと" do
      destination = build(:destination, family_name_kana: "tanaka")
      destination.valid?
      expect(destination.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが漢字の場合は登録できないこと" do
      destination = build(:destination, first_name_kana: "雅人")
      destination.valid?
      expect(destination.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが漢字の場合は登録できないこと" do
      destination = build(:destination, family_name_kana: "雅人")
      destination.valid?
      expect(destination.errors[:family_name_kana]).to include("は不正な値です")
    end
  end
end