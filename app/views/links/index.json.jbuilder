json.array!(@links) do |link|
  json.extract! link, :id, :url, :slug, :hits
  json.url link_url(link, format: :json)
end
