json.extract! gallery, :id, :name, :description, :user_id, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
