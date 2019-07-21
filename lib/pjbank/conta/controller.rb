# frozen_string_literal: true

require_relative 'credenciamento'
require_relative 'consulta'

module PJBank
  module Conta
    class Controller
      attr_reader :http

      def initialize(http)
        @http = http
      end

      def credenciamento
        Conta::Credenciamento.new(http)
      end

      def consulta
        Conta::Consulta.new(http)
      end
    end
  end
end
