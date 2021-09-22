require 'time'

class LZUtils
  # 检查是否是手机号
  def self.is_cell_phone(str)
    str =~ /^\d+$/
  end

  def self.is_chinese_mobile(str)
    str =~ /^1[35789]\d{9}$/
  end

  def self.is_date(str)
    str =~ /^\d{4}\.\d{1,2}\.\d{1,2}$/ || str =~ /^\d{4}-\d{1,2}-\d{1,2}$/
  end

  def self.is_month_date(str)
    tr =~ /^\d{4}\.\d{1,2}$/ || str =~ /^\d{4}-\d{1,2}-\d{1,2}$/
  end

  def self.is_email?(str)
    str =~ /^\w+@\w+\.\w+(\.\w+)?$/
  end

  def self.is_url(str)
    str =~ /^https?:\/\/.+\/$/i
  end

  def self.get_date(str)
    Date.parse(str)
  end

  def self.get_month_date(str)
    str += '-01'
    Date.parse(str)
  end

  def self.is_ip_addr(str)
    str =~ /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/ &&
        $1.to_i <= 255 && $2.to_i <= 255 && $3.to_i <= 255 && $4.to_i <= 255
  end

  # 获取随机字符串
  def self.gen_rand_str(len)
    rand(36 ** len).to_s(36)
  end

  # 获取数字随机字符串
  def self.gen_rand_num(len)
    rand(10 ** len).to_s(10).rjust(len, '0')
  end

  def self.get_datetime(str)
    Time.parse(str)
  end

  # 格式化日期时间
  def self.format_datetime(datetime)
    datetime.strftime('%Y-%m-%d %H:%M:%S')
  end

  # 格式化日期时间到分
  def self.format_date_min(datetime)
    datetime.strftime('%m-%d %H:%M')
  end

  # 格式化日期
  def self.format_date(datetime)
    datetime.strftime('%Y.%m.%d')
  end

  # 格式化时间
  def self.format_time_minute(time)
    time.strftime('%H:%M')
  end

  # 格式化時間
  def self.format_time(time)
    time.strftime('%H:%M:%S')
  end

  # 格式化钱
  def self.format_money(amount)
    ActiveSupport::NumberHelper::NumberToCurrencyConverter.convert(amount, {unit: ''})
  end

  # 格式化數字
  def self.format_number(amount, scale, delimiter = ',')
    ActiveSupport::NumberHelper::NumberToCurrencyConverter.convert(amount, {unit: '', precision: scale, delimiter: delimiter}).to_s.gsub(/\s+/, '')
  end

  # 格式化数字货币数量
  def self.format_coin(amount)
    format_number(amount, 6)
  end

  # 格式化整数
  def self.format_integer(amount)
    ActiveSupport::NumberHelper::NumberToCurrencyConverter.convert(amount, {unit: '', precision: 0})
  end

  # 获取手机号(隐藏中间4位)
  def self.get_encrypted_mobile(mobile)
    tmp_mobile = mobile.clone
    tmp_mobile[3..6] = '****'
    tmp_mobile
  end

  def self.formatted_space(space_in_t)
    if space_in_t < 1024
      "#{space_in_t} T"
    elsif space_in_t < 1024 * 1024
      "#{space_in_t / 1024} P"
    elsif space_in_t < 1024 * 1024 * 1024
      "#{space_in_t / 1024 / 1024} E"
    end
  end
end