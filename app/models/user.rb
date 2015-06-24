class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, through: :user_languages

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
end
