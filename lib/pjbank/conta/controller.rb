# frozen_string_literal: true

require_relative 'credenciamento'
require_relative 'consulta'
require_relative 'transacao'
require_relative 'subconta'

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

      def transacao
        Conta::Transacao.new(http)
      end

      def subconta
        Conta::Subconta.new(http)
      end

      def boleto
        Conta::Boleto.new(http)
      end
    end
  end
end
