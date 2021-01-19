require 'rails_helper'

describe UsersSerializer, type: :class do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'reports this data' do
    # binding.pry
    payload = UsersSerializer.new(@user).to_json
    json_payload = {
      "data": {
        "id": "#{@user.id}",
        "type": "users",
        "attributes": {
          "email": "#{@user.email}",
          "api_key": "#{@user.api_key}"
        }
      }
    }
    expect(JSON.parse(payload, symbolize_names: true)).to eq(json_payload)
  end
end
