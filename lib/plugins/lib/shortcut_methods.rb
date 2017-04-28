def dump(data)
  ActiveSupport::Deprecation.warn("Replace dump with rails logger (#{caller[0..4].join("\n")})")
  Sys::Lib::Debugger::Dump.dump_log(data)
end

def debug_log(message)
  Rails.logger.debug "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] DEBUG  #{message.pretty_inspect}"
end

def info_log(message)
  Rails.logger.info "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] INFO  #{message}"
end

def warn_log(message)
  Rails.logger.warn "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] WARN  #{message}"
end

def error_log(message)
  Rails.logger.error "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] ERROR  #{message}"
end

class String
  def to_utf8
    require "nkf"
    NKF.nkf('-wxm0', self.to_s)
  end
end
