class User < ApplicationRecord
  include Clearance::User
  has_many :need_statuses, dependent: :destroy
end
