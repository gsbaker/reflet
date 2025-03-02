# frozen_string_literal: true

george = User.find_or_initialize_by type: "Individual", name: "George Baker", email: "george@reflet.io"
kate = User.find_or_initialize_by type: "Therapist", name: "Kate Anderson", email: "kate@reflet.io"

users = [george, kate]

users.each do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.save!
end

Therapy.find_or_create_by(client: george, therapist: kate, started_at: Time.zone.now - 1.week)
