class MapquestApiService
  def self.find_coordinates(location)
    response = conn.get do |c|
      c.params[:location] = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(
      url: 'http://www.mapquestapi.com/geocoding/v1/address',
      params: {
                key: ENV['MAPQUEST_API_KEY'],
                maxResults: 1
      })
  end
end
