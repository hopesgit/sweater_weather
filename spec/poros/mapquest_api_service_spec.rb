require 'rails_helper'

describe MapquestApiService, type: :class do
  describe 'it can get a response from the appropriate API' do
    it 'calls MapQuests Geolocation API', type: :request do
      WebMock.allow_net_connect!

      response = MapquestApiService.find_coordinates("denver,co")

      expect(response).to be_a Hash
      expect(response.keys).to contain_exactly(:info, :options, :results)
      expect(response[:info].keys).to contain_exactly(:statuscode, :copyright, :messages)
      expect(response[:info][:statuscode]).to be_an Integer
      expect(response[:info][:copyright]).to be_a Hash
      expect(response[:info][:messages]).to be_an Array
      expect(response[:info][:copyright].keys).to contain_exactly(:text, :imageUrl, :imageAltText)
      expect(response[:info][:copyright][:text]).to be_a String
      expect(response[:info][:copyright][:imageUrl]).to be_a String
      expect(response[:info][:copyright][:imageAltText]).to be_a String
      expect(response[:options].keys).to contain_exactly(:maxResults, :thumbMaps, :ignoreLatLngInput)
      expect(response[:options][:maxResults]).to be_an Integer
      expect(response[:options][:thumbMaps]).to eq(true).or eq(false)
      expect(response[:options][:ignoreLatLngInput]).to eq(true).or eq(false)
      expect(response[:results]).to be_an Array
      expect(response[:results][0]).to be_a Hash
      expect(response[:results][0].keys).to contain_exactly(:providedLocation, :locations)
      expect(response[:results][0][:providedLocation]).to be_a Hash
      expect(response[:results][0][:providedLocation].keys).to contain_exactly(:location)
      expect(response[:results][0][:providedLocation][:location]).to be_a String
      expect(response[:results][0][:locations]).to be_an Array
      expect(response[:results][0][:locations][0]).to be_a Hash
      expect(response[:results][0][:locations][0].keys).to contain_exactly(:street, :adminArea6, :adminArea6Type, :adminArea5, :adminArea5Type, :adminArea4, :adminArea4Type, :adminArea3, :adminArea3Type, :adminArea1, :adminArea1Type, :postalCode, :geocodeQualityCode, :geocodeQuality, :dragPoint, :sideOfStreet, :linkId, :unknownInput, :type, :latLng, :displayLatLng, :mapUrl)
      expect(response[:results][0][:locations][0][:street]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea6]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea6Type]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea5]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea5Type]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea4]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea4Type]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea3]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea3Type]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea1]).to be_a String
      expect(response[:results][0][:locations][0][:adminArea1Type]).to be_a String
      expect(response[:results][0][:locations][0][:postalCode]).to be_a String
      expect(response[:results][0][:locations][0][:geocodeQualityCode]).to be_a String
      expect(response[:results][0][:locations][0][:geocodeQuality]).to be_a String
      expect(response[:results][0][:locations][0][:dragPoint]).to eq(true).or eq(false)
      expect(response[:results][0][:locations][0][:sideOfStreet]).to be_a String
      expect(response[:results][0][:locations][0][:linkId]).to be_a String
      expect(response[:results][0][:locations][0][:unknownInput]).to be_a String
      expect(response[:results][0][:locations][0][:type]).to be_a String
      expect(response[:results][0][:locations][0][:latLng]).to be_a Hash
      expect(response[:results][0][:locations][0][:displayLatLng]).to be_a Hash
      expect(response[:results][0][:locations][0][:mapUrl]).to be_a String
      expect(response[:results][0][:locations][0][:latLng].keys).to contain_exactly(:lat, :lng)
      expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a Float
      expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a Float
      expect(response[:results][0][:locations][0][:displayLatLng].keys).to contain_exactly(:lat, :lng)
      expect(response[:results][0][:locations][0][:displayLatLng][:lat]).to be_a Float
      expect(response[:results][0][:locations][0][:displayLatLng][:lng]).to be_a Float
    end
  end
end
