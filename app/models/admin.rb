class Admin < ApplicationRecord
  has_secure_password

  enum role: [:admin, :finance]

  has_one :admin_session

  after_create :gen_session

  def role_name
    if admin?
      '系统管理员'
    elsif finance?
      '财务'
    else
      '-'
    end
  end

  private

  def gen_session
    AdminSession.create(admin: self)
  end
end
