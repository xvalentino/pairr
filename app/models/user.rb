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
