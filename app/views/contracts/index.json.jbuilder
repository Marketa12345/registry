json.array!(@contracts) do |contract|
  json.extract! contract, :id, :date_from, :date_to, :description
  json.url contract_url(contract, format: :json)
end
