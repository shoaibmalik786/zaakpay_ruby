module ZaakpayRuby
# This class creates wrappers around the Zaakpay response
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