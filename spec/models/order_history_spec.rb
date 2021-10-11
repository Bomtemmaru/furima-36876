require 'rails_helper'

RSpec.describe OrderHistory, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_history = FactoryBot.build(:order_history, user_id: user.id, item_id: item.id)
      sleep(1.5)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_history).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_history.building = ''
        expect(@order_history).to be_valid
      end
      
    end

    context '内容に問題がある場合' do

      it 'tokenが空だと保存できないこと' do
        @order_history.token = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @order_history.post_code = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_history.post_code = '1234567'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @order_history.prefecture_id = 1
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_history.city = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと保存できないこと' do
        @order_history.block = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Block can't be blank")
      end

      it 'phoneが空だと保存できないこと' do
        @order_history.phone = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Phone can't be blank")
      end
      
      it 'userが紐付いていないと保存できないこと' do
        @order_history.user_id = nil
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_history.item_id = nil
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
