require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe '#create' do
    context '正常な場合' do
      it 'nameとemailとpassworodが正常な値が入力されている場合作成できる' do
        expect(@user.valid?).to eq(true)
      end
      it 'emailが255文字以下の場合作成可能' do
        @user.email = 'n' * 245 + '@sample.jp'
        expect(@user.valid?).to eq(true)
      end
      it 'emailは全て小文字で保存される' do
        @user.email = 'HOGE@GMAIL.COM'
        @user.save!
        expect(@user.reload.email).to eq 'hoge@gmail.com'
      end
    end

    context '異常な値の場合' do
    it 'nameが空の場合作成できない' do
      @user.name = nil
      expect(@user.valid?).to eq(false)
    end
    it '既に存在するnameの場合作成できない' do 
      other = build(:user)
      expect(other.valid?).to eq(false)
    end
    it 'nameが50文字を超える場合作成できない' do
      @user.name = 'n' * 51
      expect(@user.valid?).to eq(false)
    end
    it 'emailが空の場合作成できない' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end
    it 'emailが255文字を超える場合作成できない ' do
      @user.email = 'n' * 256
      expect(@user.valid?).to eq(false)
    end
    it 'emailは、@を含んでいない場合作成できない' do
      @user.email = 'abcd'
      expect(@user.valid?).to eq(false)
    end
    it '既にに存在するemailの場合作成できない' do
      @user.save
      other = build(:user, name: "hoge", email: "hoge@gmail.com")
      expect(other.valid?).to eq(false)
    end
    it 'passwordの値が空の場合作成できない' do
      @user.password = nil
      expect(@user.valid?).to eq(false)
    end
    it 'passwordの文字数が7文字の場合作成できない' do
      @user.password = 'abcdefg'
      expect(@user.valid?).to eq(false)
    end
    it 'passwordの文字数が72文字を超える場合作成できない' do
      @user.password = 'n' * 73
      expect(@user.valid?).to eq(false)
    end
    it 'passwordの値とpassword_confirmationの値が異なる場合作成できない' do
      @user.password_confirmation = 'password2'
      expect(@user.valid?).to eq(false)
    end
    it 'パスワードが暗号化されていること' do
      expect(@user.password_digest).to_not eq 'password'
    end
    it 'prolifeの文字数が255文字を超える場合作成できない' do
      @user.profile = 'n' * 256
      expect(@user.valid?).to eq(false)
    end
    end
  end
end