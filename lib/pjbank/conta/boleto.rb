# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Boleto < Base
      def criar(dados)
        http.post("#{base_url_path}/:credencial/recebimentos/transacoes", payload: dados)
      end

      def imprimir(dados)
        http.post("#{base_url_path}/:credencial/recebimentos/transacoes/lotes", payload: dados, content_type: 'application/x-www-form-urlencoded')
      end

      def cancelar(id_pedido)
        http.delete("#{base_url_path}/:credencial/recebimentos/transacoes?#{id_pedido}")
      end
    end
  end
end
