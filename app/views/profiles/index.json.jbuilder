json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :surname, :street, :street_number, :zip_code, :city
  json.url profile_url(profile, format: :json)
end
