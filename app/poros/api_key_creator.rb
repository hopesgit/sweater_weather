class ApiKeyCreator
  def self.generate_api_key
    SecureRandom.base64
  end
end
