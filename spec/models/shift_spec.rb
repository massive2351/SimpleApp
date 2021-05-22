require 'rails_helper'

RSpec.describe 'Shiftモデルのテスト', type: :model do
  
  describe 'バリデーションのテスト' do
    
    let(:shift) { FactoryBot.create(:shift) }
    subject { shift.valid? }
    
    context '有効なデーターは保存されるか？' do
      
      it "有効な新規ユーザーの場合は保存されるか" do
        expect(shift).to be_valid
      end
    end
    
    context 'start_time カラム' do
      
      it '空欄でないこと' do
        shift.start_time = ''
        is_expected.to eq false
      end
      
      #it "last_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      #  shift = Shift.new(start_time: '')
      #  expect(shift).to be_invalid
      #  expect(shift).to have_content 'シフト追加されていません!'
      #end
    end
    
    context 'end_time カラム' do
      
      it '空欄でないこと' do
        shift.end_time = ''
        is_expected.to eq false
      end
    end
    
    context 'type カラム' do
      
      it '空欄でないこと' do
        shift.type = ''
        is_expected.to eq false
      end
    end
    
    context 'work カラム' do
      
      it '空欄でないこと' do
        shift.work = ''
        is_expected.to eq false
      end
    end
    
    context 'status カラム' do
      
      it '空欄でないこと' do
        shift.status = ''
        is_expected.to eq false
      end
    end
    
    context 'user_id カラム' do
      
      it '空欄でないこと' do
        shift.user_id= ''
        is_expected.to eq false
      end
    end
    
    context 'customer_id カラム' do
      
      it '空欄でないこと' do
        shift.customer_id= ''
        is_expected.to eq false
      end
    end
    
  end 
  
  
  
  
  
  
end
