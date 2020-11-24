require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '#create' do
    before do
      @tweet = FactoryBot.build(:tweet)
    end

    describe 'スポット投稿' do
      context '投稿ができる場合' do
        it 'image,spot,comment,advice,area_idが存在していれば投稿できること' do
          expect(@tweet).to be_valid
        end
      end
      context '投稿ができない場合' do
        it 'imageが空では投稿できないこと' do
          @tweet.image = nil
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include("Image can't be blank")
        end
        it 'spotが空では投稿できないこと' do
          @tweet.spot = nil
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include("Spot can't be blank")
        end
        it 'spotが16文字以上では投稿できないこと' do
          @tweet.spot = "とうきょうとえどとうきょうはくぶつかん"
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include('Spot is too long (maximum is 16 characters)')
        end
        it 'commentが空では投稿できないこと' do
          @tweet.comment = nil
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include("Comment can't be blank")
        end
        it 'adviceが空では投稿できないこと' do
          @tweet.advice = nil
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include("Advice can't be blank")
        end
        it 'area_idが空では投稿できないこと' do
          @tweet.area_id = nil
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include("Area can't be blank", "Area is not a number")
        end
        it 'area_idが1では投稿できないこと' do
          @tweet.area_id = 1
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include("Area must be other than 1")
        end
      end
    end
  end
end
