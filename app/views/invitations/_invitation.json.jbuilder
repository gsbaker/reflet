json.extract! invitation, :id, :therapist_id, :user_id, :status, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
