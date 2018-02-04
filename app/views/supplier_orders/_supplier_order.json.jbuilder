json.extract! supplier_order, :id, :order_name, :ref_number, :created_at, :updated_at
json.url supplier_order_url(supplier_order, format: :json)
