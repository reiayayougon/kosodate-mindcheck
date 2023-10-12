require 'rails_helper'

RSpec.describe Album, type: :model do
    context '全てのフィールドが有効な場合' do
        it '有効であること' do
            album = build(:album, user: create(:user))
            expect(album).to be_valid
        end
    end

    context 'タイトルが存在しない場合' do
        it '無効であること' do
            album = build(:album, title: nil, user: create(:user))
            expect(album).to be_invalid
            expect(album.errors[:title]).to include("can't be blank")
        end
    end

    context '画像が存在しない場合' do
        it '無効であること' do
            album = build(:album, album_image: nil, user: create(:user))
            expect(album).to be_invalid
            expect(album.errors[:album_image]).to include("can't be blank")
        end
    end

    context 'タイトルが255文字以内の場合' do
        it '有効であること' do
            album = build(:album, title: 'a' * 255, user: create(:user))
            expect(album).to be_valid
        end
    end

    context '本文が255文字以上の場合' do
        it '無効であること' do
            album = build(:album, title: 'a' * 256, user: create(:user))
            expect(album).to be_invalid
            expect(album.errors[:title]).to include("is too long (maximum is 255 characters)")
        end
    end

    context '内容が655文字以内の場合' do
        it '有効であること' do
            album = build(:album, introduction: 'a' * 655, user: create(:user))
            expect(album).to be_valid
        end
    end

    context '内容が655文字以上の場合' do
        it '無効であること' do
            album = build(:album, introduction: 'a' * 656, user: create(:user))
            expect(album).to be_invalid
            expect(album.errors[:introduction]).to include("is too long (maximum is 655 characters)")
        end
    end
end