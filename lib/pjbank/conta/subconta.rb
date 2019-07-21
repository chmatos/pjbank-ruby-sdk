# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Subconta < Base
      def criar(dados)
        http.post("#{base_url_path}/:credencial/subcontas", payload: dados)
      end

      def consultar(subconta, com_saldo: false)
        dados = com_saldo == true ? "?com_saldo=true" : nil
        http.get("#{base_url_path}/:credencial/subcontas/#{subconta}#{dados}")
      end

      def extrato(dados)
        http.get("#{base_url_path}/:credencial/transacoes?#{http.converte(dados)}")
      end
    end
  end
end
