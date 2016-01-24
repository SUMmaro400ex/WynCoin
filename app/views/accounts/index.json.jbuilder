json.array!(@accounts) do |account|
  json.extract! account, :id, :company_name, :email
  json.url account_url(account, format: :json)
end
