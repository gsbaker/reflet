# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "yaml"

needs = YAML.load_file("db/seeds/needs.yml")

needs.each do |need|
  Need.find_or_create_by!(title: need["title"], category: need["category"])
end

gad7_questionnaire = Questionnaire.find_or_create_by!(
  title: "GAD-7",
  description: "Over the last two weeks, how often have you been bothered by any of the following problems?"
)

gad7questions = YAML.load_file("db/seeds/gad7.yml")

gad7questions.each do |question|
  gad7_questionnaire.questions.find_or_create_by!(title: question["title"])
end

load(Rails.root.join("db", "seeds", "#{Rails.env.downcase}.rb"))
