require 'rails_helper'

describe User do
  describe '#create' do

    it "nicknameとemail、passwordとpassword_confirmation、first_nameとfamily_name、first_nama_kanaとfamily_name_kana、birth_dateが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "重複したemailが存在する場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "first_nameが半角の場合は登録できないこと" do
      user = build(:user, first_name: "ﾏｻﾄ")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "family_nameが半角の場合は登録できないこと" do
      user = build(:user, family_name: "tanaka")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "first_nameが全角数字の場合は登録できないこと" do
      user = build(:user, first_name: "１２３４５")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "family_nameが全角数字の場合は登録できないこと" do
      user = build(:user, family_name: "１２３４５田中")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end
    
    it "first_name_kanaが半角の場合は登録できないこと" do
      user = build(:user, first_name_kana: "ﾏｻﾄ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが半角の場合は登録できないこと" do
      user = build(:user, family_name_kana: "tanaka")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが漢字の場合は登録できないこと" do
      user = build(:user, first_name_kana: "雅人")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが漢字の場合は登録できないこと" do
      user = build(:user, family_name_kana: "雅人")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

  end
end