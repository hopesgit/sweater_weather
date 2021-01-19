require 'rails_helper'

describe OpenWeatherApiService, type: :class do
  describe 'it can get a response from the appropriate API' do
    it 'calls OpenWeathers Onecall API', type: :request do
      WebMock.allow_net_connect!

      response = OpenWeatherApiService.get_weather(32.7668, -96.7836)

      expect(response).to be_a Hash
      expect(response.keys).to contain_exactly(:lat, :lon, :timezone, :timezone_offset, :current, :hourly)
      expect(response[:lat]).to be_a Float
      expect(response[:lon]).to be_a Float
      expect(response[:timezone]).to be_a String
      expect(response[:timezone_offset]).to be_an Integer
      expect(response[:current]).to be_a Hash
      expect(response[:hourly]).to be_an Array
      expect(response[:current].keys).to contain_exactly(:dt, :sunrise, :sunset, :temp, :feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_speed, :wind_deg, :weather)
      expect(response[:current][:dt]).to be_an Integer
      expect(response[:current][:sunrise]).to be_an Integer
      expect(response[:current][:sunset]).to be_an Integer
      expect(response[:current][:temp]).to be_a Float
      expect(response[:current][:feels_like]).to be_a Float
      expect(response[:current][:pressure]).to be_an Integer
      expect(response[:current][:humidity]).to be_an Integer
      expect(response[:current][:dew_point]).to be_a Float
      expect(response[:current][:uvi]).to be_a Numeric
      expect(response[:current][:clouds]).to be_an Integer
      expect(response[:current][:visibility]).to be_an Integer
      expect(response[:current][:wind_speed]).to be_a Float
      expect(response[:current][:wind_deg]).to be_an Integer
      expect(response[:current][:weather]).to be_an Array
      expect(response[:current][:weather][0]).to be_a Hash
      expect(response[:current][:weather][0].keys).to contain_exactly(:id, :main, :description, :icon)
      expect(response[:current][:weather][0][:id]).to be_an Integer
      expect(response[:current][:weather][0][:main]).to be_a String
      expect(response[:current][:weather][0][:description]).to be_a String
      expect(response[:current][:weather][0][:icon]).to be_a String
      expect(response[:hourly].count).to eq(48)
      expect(response[:hourly][0]).to be_a Hash
      expect(response[:hourly][0].keys).to contain_exactly(:dt, :temp, :feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_speed, :wind_deg, :weather, :pop)
      expect(response[:hourly][0][:dt]).to be_an Integer
      expect(response[:hourly][0][:temp]).to be_a Float
      expect(response[:hourly][0][:feels_like]).to be_a Float
      expect(response[:hourly][0][:pressure]).to be_an Integer
      expect(response[:hourly][0][:humidity]).to be_an Integer
      expect(response[:hourly][0][:dew_point]).to be_a Float
      expect(response[:hourly][0][:uvi]).to be_a Float
      expect(response[:hourly][0][:clouds]).to be_an Integer
      expect(response[:hourly][0][:visibility]).to be_an Integer
      expect(response[:hourly][0][:wind_speed]).to be_a Float
      expect(response[:hourly][0][:wind_deg]).to be_an Integer
      expect(response[:hourly][0][:weather]).to be_an Array
      expect(response[:hourly][0][:pop]).to be_a Numeric
      expect(response[:hourly][0][:weather][0]).to be_a Hash
      expect(response[:hourly][0][:weather][0].keys).to contain_exactly(:id, :main, :description, :icon)
      expect(response[:hourly][0][:weather][0][:id]).to be_an Integer
      expect(response[:hourly][0][:weather][0][:main]).to be_a String
      expect(response[:hourly][0][:weather][0][:description]).to be_a String
      expect(response[:hourly][0][:weather][0][:icon]).to be_a String
    end
  end
end
