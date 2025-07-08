# frozen_string_literal: true

client = User.find_or_initialize_by type: "Individual", name: "Client McDemo", email: "client@reflet.io"
client.avatar = File.open(Rails.root.join("db/seeds/client.jpg"))
therapist = User.find_or_initialize_by type: "Therapist", name: "Couchy Talkerson", email: "therapist@reflet.io"
therapist.avatar = File.open(Rails.root.join("db/seeds/therapist.jpg"))
individual = User.find_or_initialize_by type: "Individual", name: "Individual Demo", email: "individual@reflet.io"

users = [client, therapist, individual]

users.each do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.save!
end

Therapy.find_or_create_by!(client:, therapist:)
