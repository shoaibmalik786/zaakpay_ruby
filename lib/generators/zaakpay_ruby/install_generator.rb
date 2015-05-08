require 'securerandom'

module ZaakpayRuby
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates zaakpay initializer for the application"

      def copy_initializer
        template "zaakpay_initializer.rb", "config/initializers/zaakpay.rb"

        puts "Install complete! Truly Outrageous!"
      end
    end
  end
end