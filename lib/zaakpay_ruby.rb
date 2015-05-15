require "zaakpay_ruby/version"
require "zaakpay_ruby/request"
require "zaakpay_ruby/response"
require "zaakpay_ruby/transaction"

module ZaakpayRuby

  # This is class for initialize the secret key
  class Configuration
    attr_accessor :secret_key, :log_level

    def initialize
      self.secret_key = nil
      self.log_level = 'info'
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  # This is where the checksum generation happens
  # arguements: a parameters hash.
  # return value: HMAC-SHA-256 checksum usign the Key
  def self.generate_checksum(params_hash)
    #sorted_params = self.sort_params(params_hash)
    paramsstring = ""
    params_hash.each {|key, value|
      paramsstring += "'" + value.to_s + "'"
    }
    checksum = OpenSSL::HMAC.hexdigest('sha256', ZaakpayRuby.configuration.secret_key, paramsstring)
  end


  # This is a helper method for generating ZaakpayRuby checksum
  # It sorts the parameters hash in ascending order of the keys
  # arguments: a parameters hash
  # return value: a hash with sorted in ascending order of keys
  # It is not using now but would keep for the future
  def self.sort_params(params_hash)
    sorted_params_hash = {}
    sorted_keys = params_hash.keys.sort{|x,y| x <=> y}
    sorted_keys.each do |k|
      sorted_params_hash[k] = params_hash[k]
    end
    sorted_params_hash
  end

end
