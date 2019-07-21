# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Recebimento < Base
      def initialize(http)
        @http = http
      end

      def boleto
        Conta::Recebimento::Boleto.new(http)
      end

      def cartao
        Conta::Recebimento::Cartao.new(http)
      end

      def extrato(dados = nil)
        dados = dados ? "?#{http.converte(dados)}" : ''
        http.get("#{base_url_path}/:credencial/recebimentos/transacoes#{dados}")
      end

      def cancelar(id_pedido)
        http.delete("#{base_url_path}/:credencial/recebimentos/transacoes?#{id_pedido}")
      end
    end
  end
end
