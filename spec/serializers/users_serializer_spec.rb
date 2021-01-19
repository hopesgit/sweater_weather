require 'rails_helper'

describe UsersSerializer, type: :class do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'reports this data' do
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
    parsed_payload = JSON.parse(payload, symbolize_names: true)
    expect(parsed_payload).to eq(json_payload)
    expect(parsed_payload.keys).to contain_exactly(:data)
    expect(parsed_payload[:data].keys).to contain_exactly(:id, :type, :attributes)
    expect(parsed_payload[:data][:attributes].keys).to contain_exactly(:email, :api_key)
    expect(parsed_payload[:data][:attributes].keys).to_not include(:id, :created_at, :updated_at)
  end
end
