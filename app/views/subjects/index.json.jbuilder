json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :type, :description
  json.url subject_url(subject, format: :json)
end
