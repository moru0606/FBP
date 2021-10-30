require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '#create' do 
    context '正常な値の場合' do 
      it 'titleとcontentどちらも正常な値が入力されている場合投稿できる' do 
        expect(@post.valid?).to eq(true)
      end
      it 'titleが50文字の場合投稿できる' do
        @post.title = 't' * 50
        expect(@post.valid?).to eq(true)
      end
      it 'bodyが255文字の場合投稿できる' do 
        @post.content = 'c' * 255
        expect(@post.valid?).to eq(true)
      end
    end
  context '異常な値の場合' do
    it 'titleが空の場合投稿できない' do
      @post.title = nil
      expect(@post.valid?).to eq(false)
    end
    it 'titleが50文字を超えた場合投稿できない' do
      @post.title = 't' * 51
      expect(@post.valid?).to eq(false)
    end
    it 'contentが空の場合投稿できない' do
      @post.content = nil
      expect(@post.valid?).to eq(false)
    end
    it 'contentが10文字より少ない場合投稿できない' do
      @post.content = 'abcdefghi'
      expect(@post.valid?).to eq(false)
    end
    it 'contentが255文字を超えた場合投稿できない' do
      @post.content = 'c' * 256
      expect(@post.valid?).to eq(false)
    end
  end
  end
end