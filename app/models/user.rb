class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.find_or_create_by_uid(uid)
    user = User.find_or_create_by(uid: uid)

    user.password = Devise.friendly_token[0, 20]
    user.save!

    user
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
