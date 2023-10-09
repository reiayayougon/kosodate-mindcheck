require 'rails_helper'

RSpec.describe Comment, type: :model do
  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  end

  context '本文が存在しない場合' do
    it '無効であること' do
      ActiveRecord::Base.transaction do
        comment = build(:comment, content: nil)
        expect(comment).to be_invalid
      end
    end
  end

  context '本文が255文字以内の場合' do
    it '有効であること' do
      comment = build(:comment, content: 'a' * 255)
      expect(comment).to be_valid
    end
  end

  context '本文が255以上の場合' do
    it '無効であること' do
      ActiveRecord::Base.transaction do
        comment = build(:comment, content: 'a' * 256)
        expect(comment).to be_invalid
      end
    end 
  end
end