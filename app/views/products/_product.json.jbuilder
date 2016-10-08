json.extract! product, :id, :name, :price_in_cents, :released_at, :created_at, :updated_at
json.url product_url(product, format: :json)