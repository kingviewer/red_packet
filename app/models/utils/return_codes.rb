module Utils
  module ReturnCodes
    SUCCESS = 'success'
    PERMISSION_DENIED = 'permission_denied'
    SYSTEM_BUSY = 'system_busy'
    INVALID_REQUEST = 'invalid_request'
    LOGIN_TO_OPERATE = 'login_to_operate'
    INVALID_PARAMS = 'invalid_params'
    USER_NOT_EXIST = 'user_not_exist'
    ERROR = 'error'

    class << self
      def success(data = nil)
        rs = {code: SUCCESS}
        rs[:data] = data if data
        rs
      end

      def permission_denied
        {code: PERMISSION_DENIED, msg: I18n.t('errors.permission_denied')}
      end

      def system_busy
        {code: SYSTEM_BUSY, msg: I18n.t('errors.system_busy')}
      end

      def invalid_request
        {code: INVALID_REQUEST, msg: I18n.t('errors.invalid_request')}
      end

      def login_to_operate
        {code: LOGIN_TO_OPERATE, msg: I18n.t('errors.login_to_operate')}
      end

      def invalid_params
        {code: INVALID_PARAMS, msg: I18n.t('errors.invalid_params')}
      end

      def user_not_exist
        {code: USER_NOT_EXIST, msg: I18n.t('errors.user_not_exist')}
      end

      def error(msg)
        {code: ERROR, msg: msg}
      end
    end
  end
end