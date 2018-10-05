json.extract! resource, :id, :title, :description, :link, :created_at, :updated_at
json.url resource_url(resource, format: :json)
