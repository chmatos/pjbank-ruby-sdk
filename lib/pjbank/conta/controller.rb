# frozen_string_literal: true

require_relative 'credenciamento'
require_relative 'consulta'
require_relative 'transacao'
require_relative 'subconta'
require_relative 'recebimento'
require_relative 'boleto'
require_relative 'cartao'

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

      def recebimento
        Conta::Recebimento.new(http)
      end
    end
  end
end
