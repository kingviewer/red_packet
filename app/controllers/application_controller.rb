require 'lz_utils'

class ApplicationController < ActionController::Base
  # protect_from_forgery
  skip_forgery_protection
  around_action :switch_locale

  def switch_locale(&action)
    lang = params[:lang] || params[:language] || cookies[:lang] || :en
    lang = 'zh-CN' if lang =~ /zh/i
    I18n.with_locale(lang, &action)
  end

  def success(data = nil)
    rs = { code: Utils::ReturnCodes::SUCCESS }
    rs[:data] = data if data
    render json: rs, status: :ok
  end

  def ok(data)
    render json: data, status: :ok
  end

  def permission_denied
    render json: Utils::ReturnCodes.permission_denied, status: :ok
  end

  def system_busy
    render json: Utils::ReturnCodes.system_busy, status: :ok
  end

  def invalid_request
    render json: Utils::ReturnCodes.invalid_request, status: :ok
  end

  def login_to_operate
    render json: Utils::ReturnCodes.login_to_operate, status: :ok
  end

  def invalid_params
    render json: Utils::ReturnCodes.invalid_params, status: :ok
  end

  def user_not_exist
    render json: Utils::ReturnCodes.user_not_exist, status: :ok
  end

  def error(msg)
    json =
      if msg.is_a?(String)
        Utils::ReturnCodes.error(msg)
      else
        msg
      end
    render json: json, status: :ok
  end

  def response_json(rs)
    if rs[:code] == Utils::ReturnCodes::SUCCESS
      render json: rs, status: :ok
    else
      render json: rs, status: :ok
    end
  end

  def response_data(data)
    render json: data, status: :ok
  end

  def valid_address?(address)
    formatter = Ethereum::Formatter.new
    formatter.valid_address?(address)
  end
end
