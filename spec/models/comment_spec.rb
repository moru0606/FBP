require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '#create' do
    context '正常な値の場合' do
      it 'commentが正常な値が入力されている場合投稿できる' do
        expect(@comment.valid?).to eq(true)
      end
      it 'commentが255文字以内の場合投稿できる' do
        @comment.comment = 'c' * 255
        expect(@comment.valid?).to eq(true)
      end
    end
  
  context '異常な値の場合' do
    it 'commentが空の場合投稿できない' do
      @comment.comment = nil
      @comment.valid?
      expect(@comment.valid?).to eq(false)
    end
    it 'commentが255文字を超える場合投稿できない' do
    @comment.comment = 'c' * 256
    expect(@comment.valid?).to eq(false)
    end
    it 'ユーザーが紐付いていなければcommentできない' do
      @comment.user = nil
      expect(@comment.valid?).to eq(false)
    end
  end
  end
end
