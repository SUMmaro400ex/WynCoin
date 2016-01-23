module Helpers
   def get_with_token(path, params={}, headers={})
    headers.merge!(retrieve_api_token)
    get path, params, headers
  end

  def post_with_token(path, params={}, headers={})
    headers.merge!(retrieve_api_token)
    post path, params, headers
  end

  def retrieve_api_token
    {'Authorization' => "Token token=\"#{account.api_token}\""}
  end

  def json_response
    JSON.parse(response.body).with_indifferent_access
  end
end
