json.array!(@photos) do |photo|
  json.extract! photo, :id, :image, :main, :item_id
  json.url photo_url(photo, format: :json)
end
