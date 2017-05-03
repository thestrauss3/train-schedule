class User < ApplicationRecord
  validates :provider, :uid, :username, :first_name, :last_name, :email, presence: true
  validate :phone_number_must_be_valid
  
  def self.find_or_create_from_omniauth(auth)
    provider = auth.provider
    uid = auth.uid

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.provider = provider
      user.uid = uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  private

  def phone_number_must_be_valid
    if :phone_number.length != 10
      errors.add(:phone_number, "must be 10 digits.")
    end
    if :phone_number.to_i.length != 10
      errors.add(:phone_number, "may only include numbers.")
    end
  end
end
