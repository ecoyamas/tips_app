require 'rails_helper'

describe 'PostAPI' do # rubocop:disable Metrics/BlockLength
  let!(:user) { create(:user) }
  it '収入レコードが作成されること' do
    params = { user_id: user.id,
               salary_date: '2020-09-01',
               salary_name: '給料',
               income_amount: 200_000 }
    # データが作成されている事を確認
    post '/api/v1/incomes', params: params
    json = JSON.parse(response.body)
    expect(json['data']['user_id']).to eq(user.id)
    expect(json['data']['salary_date']).to eq('2020-09-01')
    expect(json['data']['salary_name']).to eq('給料')
    expect(json['data']['income_amount']).to eq(200_000)
    expect(json['status']).to eq(201)
    expect(response.status).to eq(200)
  end

  it '収入レコードが作成されないこと' do
    params = { user_id: user.id,
               salary_name: '給料',
               income_amount: 200_000 }
    post '/api/v1/incomes', params: params
    json = JSON.parse(response.body)
    expect(json['status']).to eq(401)
  end

  context 'createページに関して' do
    before do
      allow_any_instance_of(Income).to receive(:save).and_raise(ActiveRecord::RecordNotSaved, 'error') # rubocop:disable Layout/LineLength
    end
    it 'システムエラー時は500を返すこと' do
      params = { user_id: user.id,
                 salary_date: '2020-09-01',
                 salary_name: '給料',
                 income_amount: 200_000 }
      post '/api/v1/incomes', params: params
      json = JSON.parse(response.body)
      expect(json['status']).to eq(500)
    end
  end
end
