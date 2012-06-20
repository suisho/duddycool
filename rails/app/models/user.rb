class User < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.create_with_omniauth( auth )
    user = User.new
    user[:provider] = auth["provider"]
    user[:uid] = auth["uid"]

    unless auth["info"].blank?
      user[:name] = auth["info"]["name"]
      user[:screen_name] = auth["info"]["nickname"]
      user[:image] = auth["info"]["image"]
    end
    user.save
    return user
  end

  def self.find_from_oauth(provider, uid)
    return User.where( provider: provider, uid: uid ).first
  end
end
