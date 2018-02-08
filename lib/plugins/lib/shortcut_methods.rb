def debug_log(message)
  Rails.logger.debug "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] DEBUG  #{message.pretty_inspect}"
end

def info_log(message)
  Rails.logger.info "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] INFO  #{message}"
end

def warn_log(message)
  message = "#{message}: #{message.backtrace.join("\n")}" if message.is_a?(Exception) && message.backtrace.present?
  Rails.logger.warn "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] WARN  #{message}"
end

def error_log(message)
  message = "#{message}: #{message.backtrace.join("\n")}" if message.is_a?(Exception) && message.backtrace.present?
  Rails.logger.error "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] ERROR  #{message}"
end

class String
  def to_utf8
    require "nkf"
    NKF.nkf('-wxm0', self.to_s)
  end
end
