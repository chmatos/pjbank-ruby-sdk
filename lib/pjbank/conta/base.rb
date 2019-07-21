# frozen_string_literal: true

module PJBank
  module Conta
    class Base
      attr_reader :http

      def initialize(http)
        @http = http
      end

      private

      def base_url_path
        '/contadigital'
      end
    end
  end
end
