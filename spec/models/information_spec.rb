require 'rails_helper'

RSpec.describe "information モデルのテスト", type: :model do

  let(:information) { FactoryBot.create(:information) }
  subject { information.valid? }

  describe '実際に保存してみる' do

    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:information)).to be_valid
    end

  end

  context 'title カラム' do
    it '空欄でないこと' do
      information.title = ''
      is_expected.to eq false
    end
  end

  context 'end_time カラム' do
    it '空欄でないこと' do
      information.body = ''
      is_expected.to eq false
    end

  end


end

