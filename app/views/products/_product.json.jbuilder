json.extract! product, :id, :brand_id, :name, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)