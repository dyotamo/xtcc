json.extract! requisition, :id, :url, :created_at, :updated_at
json.url requisition_url(requisition, format: :json)
