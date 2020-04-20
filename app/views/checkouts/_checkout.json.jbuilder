json.extract! checkout, :id, :first_name, :last_name, :address, :city, :country, :postal_code, :phone, :pay_type, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
