class User < ActiveRecord::Base
  has_many :pairs
  has_many :user_languages
  has_many :languages, through: :user_languages
  has_many :potential_matches, through: :pairs, class_name: 'User', foreign_key: 'potential_match_id'

  def matches
    referenced_relationships = Pair.includes(:potential_match).where(potential_match_id: id).where(status: 2)
    owned_relationships = Pair.includes(:user).where(user_id: id).where(status: 2)
    matches = referenced_relationships + owned_relationships
    turn_to_user_matches(matches)
  end

  def turn_to_user_matches(pairs)
    pairs.map do |pair|
      if pair.user_id == id
        pair.potential_match
      else
        pair.user
      end
    end
  end

  def random_user
    (matches_that_other_people_started + not_attempted_with.shuffle).first
  end

  def matches_that_other_people_started
    associated_pairs = Pair.includes(:user).where(potential_match_id: id)
    associated_pairs = associated_pairs.select {|pair| pair.count != 2 }
    turn_to_users(associated_pairs)
  end

  def not_attempted_with
    User.all.select {|user| !attempted_with.include?(user) && user != self }
  end

  def attempted_with
    potential_matches + inverse_of_potential_matches
  end

  def inverse_of_potential_matches
    associated_pairs = find_pairs_by_potential_match_ids
    turn_to_users(associated_pairs)
  end

  def find_pairs_by_potential_match_ids
    Pair.includes(:user).where(potential_match_id: id)
  end

  def turn_to_users(pairs)
    pairs.map { |t| t.user }
  end

  def self.find_or_create_by_auth(auth_data)
    user = find_or_create_by_uid(auth_data["uid"])
    user.name = auth_data["info"]["name"]
    user.image = auth_data["info"]["image"]
    user.save
    user
  end

  def self.find_or_create_by_uid(uid)
    User.find_by(uid: uid) || User.new(uid: uid)
  end

  def update_profile(data)
    update_languages(data['language'])
    self.update(description: data['user']['description'])
    return true
  end

  def update_languages(data)
    languages = data || {}
    languages.each do |language|
      begin 
        self.languages << Language.find_by(name: language)
      rescue ActiveRecord::RecordInvalid
      end
    end
  end
end
