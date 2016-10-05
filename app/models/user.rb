class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.find_or_create_by_uid(uid)
    super(uid)

    write_attribute(:password, Devise.friendly_token[0, 20])
  end
end
