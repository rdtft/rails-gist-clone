json.array!(@gists) do |gist|
  json.extract! gist, :id, :description, :content, :private
  json.url gist_url(gist, format: :json)
end
