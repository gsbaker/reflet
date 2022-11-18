class User < ApplicationRecord
  include Clearance::User
  has_many :needs, dependent: :destroy
end
