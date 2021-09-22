class AdminSession < ApplicationRecord
  belongs_to :admin

  def renew(ip_addr)
    begin
      update!(token: SecureRandom.urlsafe_base64, ip_addr: ip_addr)
    rescue
      retry
    end
  end
end
