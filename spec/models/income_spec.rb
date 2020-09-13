require 'rails_helper'
RSpec.describe Income, type: :model do
  it '値がnullの場合はエラーになること' do
    income = Income.new
    income.valid?
    expect(income.errors.full_messages).to include('ユーザーIDを入力してください')
    expect(income.errors.full_messages).to include('収入日を入力してください')
    expect(income.errors.full_messages).to include('収入名を入力してください')
    expect(income.errors.full_messages).to include('収入額を入力してください')
  end

  it 'integer以外が設定された場合はエラーになること' do
    income = Income.new(user_id: '文字列',
                        user_group_id: '文字列',
                        income_amount: '文字列')
    income.valid?
    expect(income.errors.full_messages).to include('収入額は数値で入力してください')
  end
end
