require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  
  describe 'バリデーションのテスト' do
    
    let(:customer) { FactoryBot.create(:customer) }
    subject { customer.valid? }
    
    context '有効なデーターは保存されるか？' do
      
      it "有効な新規ユーザーの場合は保存されるか" do
        expect(customer).to be_valid
      end

    end
    
    context 'last_nameカラム' do
      
      it '空欄でないこと' do
        customer.last_name = ''
        is_expected.to eq false
      end
      
      it "last_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(last_name: '')
        expect(customer).to be_invalid
        expect(customer.errors[:last_name]).to include("を入力してください")
      end
    
    end
    
    context 'first_nameカラム' do
      
      it '空欄でないこと' do
        customer.first_name = ''
        is_expected.to eq false
      end
      
      it "first_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(first_name: '')
        expect(customer).to be_invalid
        expect(customer.errors[:first_name]).to include("を入力してください")
      end
    
    end
    
    context 'last_name_kana カラム' do
      
      it '空欄でないこと' do
        customer.last_name_kana = ''
        is_expected.to eq false
      end
      
      it "first_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(last_name_kana: '')
        expect(customer).to be_invalid
        expect(customer.errors[:last_name_kana]).to include("を入力してください")
      end
    
    end
    
    context 'first_name_kana カラム' do
      
      it '空欄でないこと' do
        customer.first_name_kana = ''
        is_expected.to eq false
      end
      
      it "first_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(first_name_kana: '')
        expect(customer).to be_invalid
        expect(customer.errors[:first_name_kana]).to include("を入力してください")
      end
    
    end
    
    context 'postal_code カラム' do
      it '空欄でないこと' do
        customer.postal_code = ''
        is_expected.to eq false
      end
      
      it "postal_codeが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(postal_code: '')
        expect(customer).to be_invalid
        expect(customer.errors[:postal_code]).to include("を入力してください")
      end
    end
    
    context 'address カラム' do
      it '空欄でないこと' do
        customer.address = ''
        is_expected.to eq false
      end
      
      it "addressが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(address: '')
        expect(customer).to be_invalid
        expect(customer.errors[:address]).to include("を入力してください")
      end
    end
    
    context 'telephone_number カラム' do
      it '空欄でないこと' do
        customer.telephone_number = ''
        is_expected.to eq false
      end
      
      it "telephone_numberが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(telephone_number: '')
        expect(customer).to be_invalid
        expect(customer.errors[:telephone_number]).to include("を入力してください")
      end
    end
    
    context 'email カラム' do
      it '空欄でないこと' do
        customer.email = ''
        is_expected.to eq false
      end
      
      it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        customer = Customer.new(email: '')
        expect(customer).to be_invalid
        expect(customer.errors[:email]).to include("を入力してください")
      end
    end
   
    
  end 
end
