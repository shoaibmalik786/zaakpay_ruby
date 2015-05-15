module ZaakpayRuby
	# This class is for wrappers around the ZaakpayRuby request.
  class Request
    attr_reader :params, :all_params, :checksum

    def initialize(args_hash)
      @params = args_hash
      @checksum = ZaakpayRuby.generate_checksum(@params)
      @all_params = {}.merge(@params).merge({'checksum' => @checksum })
    end

  end
end