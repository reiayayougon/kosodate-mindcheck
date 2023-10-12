require 'rails_helper'

RSpec.describe Post, type: :model do

    context '全てのフィールドが有効な場合' do
        it '有効であること' do
            post = build(:post, user: create(:user), category: create(:category))
            expect(post).to be_valid
        end
    end

    context '本文が存在しない場合' do
        it '有効であること' do
            post = build(:post, content: nil, user: create(:user), category: create(:category))
            expect(post).to be_invalid
            expect(post.errors[:content]).to include("can't be blank")
        end
    end

    context 'カテゴリーが存在しない場合' do
        it '無効であること' do
            post = build(:post, category: nil, user: create(:user))
            expect(post).to be_invalid
            expect(post.errors[:category]).to include("must exist")
        end
    end

    context '本文が255文字以内の場合' do
        it '有効であること' do
            post = build(:post, content: 'a' * 255, user: create(:user), category: create(:category))
            expect(post).to be_valid
        end
    end

    context '本文が255文字以上の場合' do
        it '無効であること' do
            post = build(:post, content: 'a' * 256, user: create(:user), category: create(:category))
            expect(post.errors[:content]).to include("is too long (maximum is 255 characters)")
        end
    end


end
