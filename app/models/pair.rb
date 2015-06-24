class Pair < ActiveRecord::Base
  belongs_to :user
  belongs_to :potential_match, class_name: "User"
end
