class Pair < ActiveRecord::Base
  belongs_to :user
  belongs_to :potential_match, class_name: "User"

  def find_or_create_by(current_id, potential_id)
    if pair = Pair.find_by(user_id: current_id, potential_match_id: potential_id) || Pair.find_by(user_id: current_id, potential_match_id: potential_id)
      pair
    else
      Pair.create(user_id: current_id, potential_match_id: potential_id)
    end
  end

  def up
    self.status += 1
    self.count += 1
  end

  def down
    self.status = 0
    self.count += 1
  end
end
