require 'rails_helper'

describe ApiKeyCreator, type: :class do
  describe 'instance_methods' do
    it '#generate_api_key' do
      expect(ApiKeyCreator.generate_api_key).to be_a(String)
      key_1 = ApiKeyCreator.generate_api_key
      key_2 = ApiKeyCreator.generate_api_key
      key_3 = ApiKeyCreator.generate_api_key
      key_4 = ApiKeyCreator.generate_api_key
      key_5 = ApiKeyCreator.generate_api_key
      expect(key_1).to_not eq(key_2)
      expect(key_1).to_not eq(key_3)
      expect(key_1).to_not eq(key_4)
      expect(key_1).to_not eq(key_5)
      expect(key_2).to_not eq(key_3)
      expect(key_2).to_not eq(key_4)
      expect(key_2).to_not eq(key_5)
      expect(key_3).to_not eq(key_4)
      expect(key_3).to_not eq(key_5)
      expect(key_4).to_not eq(key_5)
    end
  end
end
