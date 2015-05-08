# require "ZaakpayRuby_ruby/version"

module ZaakpayRuby
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
  def self.sort_params(params_hash)
    sorted_params_hash = {}
    sorted_keys = params_hash.keys.sort{|x,y| x <=> y}
    sorted_keys.each do |k|
      sorted_params_hash[k] = params_hash[k]
    end
    sorted_params_hash
  end



  #
  # This class is for wrappers around the ZaakpayRuby request.
  #
  # Checksum is generated in the constructor, so
  #  once instantiated, object.checksum gives the value of the checksum
  #
  # Exposed attributes:
  #  params:     paramters hash, w/o the checksum
  #  all_params: paramters hash w/ the checksum
  #  checksum:   checksume generated for the params
  #
  class Request
    attr_reader :params, :all_params, :checksum

    def initialize(args_hash)
      @params = args_hash
      @checksum = ZaakpayRuby.generate_checksum(@params)
      @all_params = {}.merge(@params).merge({'checksum' => @checksum })
    end

  end

  #
  # This class creates wrappers around the Zaakpay response
  #
  # Checksum validation takes place within the `valid?` method.
  #
  #  Exposed attributes:
  #  all_params:      POST from Zaakpay as a hash
  #  params:          all_params minus checksum
  #  posted_checksum: checksume POSTed from Zaakpay
  #  checksum:        checksum generated using the POSTed params and secret
  class Response
    attr_reader :params, :all_params, :posted_checksum, :checksum

    def initialize(args_str)
      @all_params = Rack::Utils.parse_query(args_str)
      @posted_checksum = @all_params['checksum']
      @params = @all_params.reject{|k,v| k=='checksum'}
    end

    def valid?
      @checksum = ZaakpayRuby.generate_checksum(@params)
      @posted_checksum == @checksum
    end

  end
end
