module ZaakpayRuby
  class Transaction
    def self.sale(options={})
      zr = ZaakpayRuby::Request.new(options)
      return zr.all_params
    end
  end
end