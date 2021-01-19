class OpenWeatherApiService
  def self.get_weather(lat, lng)
    response = conn.get do |c|
      c.params[:lat] = lat
      c.params[:lon] = lng
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(
      url: 'https://api.openweathermap.org/data/2.5/onecall',
      params: {
        appid: ENV['OPENWEATHER_API_KEY'],
        exclude: "minutely,daily",
        units: 'imperial'
      }
    )
  end
end
