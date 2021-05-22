
require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  
  describe 'バリデーションのテスト' do
    
    let(:user) { FactoryBot.create(:user) }
    subject { user.valid? }
    
    context '有効なデーターは保存されるか？' do
      
      it "有効な新規ユーザーの場合は保存されるか" do
        expect(user).to be_valid
      end

    end
    
    context 'last_nameカラム' do
      
      it '空欄でないこと' do
        user.last_name = ''
        is_expected.to eq false
      end
      
      it "last_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(last_name: '')
        expect(user).to be_invalid
        expect(user.errors[:last_name]).to include("を入力してください")
      end
    
    end
    
    context 'first_nameカラム' do
      it '空欄でないこと' do
        user.first_name = ''
        is_expected.to eq false
      end
      
      it "first_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(first_name: '')
        expect(user).to be_invalid
        expect(user.errors[:first_name]).to include("を入力してください")
      end
    end
    
    context 'last_name_kana カラム' do
      it '空欄でないこと' do
        user.last_name_kana = ''
        is_expected.to eq false
      end
      
      it "last_name_kanaが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(last_name_kana: '')
        expect(user).to be_invalid
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end
      
    end
    
    context 'first_name_kana カラム' do
      it '空欄でないこと' do
        user.first_name_kana = ''
        is_expected.to eq false
      end
      
      it "first_name_kanaが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(first_name_kana: '')
        expect(user).to be_invalid
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end
    end
    
    context 'postal_code カラム' do
      it '空欄でないこと' do
        user.postal_code = ''
        is_expected.to eq false
      end
      
      it "postal_codeが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(postal_code: '')
        expect(user).to be_invalid
        expect(user.errors[:postal_code]).to include("を入力してください")
      end
    end
    
    context 'address カラム' do
      it '空欄でないこと' do
        user.address = ''
        is_expected.to eq false
      end
      
      it "addressが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(address: '')
        expect(user).to be_invalid
        expect(user.errors[:address]).to include("を入力してください")
      end
    end
    
    context 'telephone_number カラム' do
      it '空欄でないこと' do
        user.telephone_number = ''
        is_expected.to eq false
      end
      
      it "telephone_numberが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(telephone_number: '')
        expect(user).to be_invalid
        expect(user.errors[:telephone_number]).to include("を入力してください")
      end
    end
    
    context 'email カラム' do
      it '空欄でないこと' do
        user.email = ''
        is_expected.to eq false
      end
      
      it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = User.new(email: '')
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
      end
    end
    
  end 
end
