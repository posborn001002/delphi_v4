json.extract! person, :id, :first_name, :last_name, :email, :telephone, :organization_id, :job_title, :created_at, :updated_at
json.url person_url(person, format: :json)
