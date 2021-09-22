class UserSession < ApplicationRecord
  belongs_to :user

  def renew
    begin
      update!(token: SecureRandom.urlsafe_base64)
    rescue
      retry
    end
  end
end
