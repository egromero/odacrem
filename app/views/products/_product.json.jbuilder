json.extract! product, :id, :model_url, :certification_url, :description, :specifications, :created_at, :updated_at
json.url product_url(product, format: :json)
