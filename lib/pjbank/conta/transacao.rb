# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Transacao < Base
      def criar(dados)
        http.post("#{base_url_path}/:credencial/transacoes", payload: dados)
      end

      def historico(id_operacao)
        http.get("#{base_url_path}/:credencial/transacoes/#{id_operacao}")
      end

      def cancelar(id_operacao)
        if id_operacao.is_a?(Array)
          http.delete("#{base_url_path}/:credencial/transacoes", payload: "id_operacao=#{id_operacao}}", content_type: 'application/x-www-form-urlencoded')
        else
          http.delete("#{base_url_path}/:credencial/transacoes/#{id_operacao}")
        end
      end

#      TODO: Precisa ser implementado no futuro. Fiquei em duvida em como fazer e decide deixar para depois
#      def inserir_documento(dados)
#        dados = Openstruct.new(dados)
#        http.post("#{base_url_path}/:credencial/transacoes/#{dados.id_operacao}/documentos", payload: dados)
#      end

      def documentos(id_operacao, tipo: nil)
        tipo = tipo ? "?tipo=#{tipo}" : ''
        http.get("#{base_url_path}/:credencial/transacoes/#{id_operacao}/documentos#{tipo}")
      end

      def extrato(dados)
        http.get("#{base_url_path}/:credencial/transacoes?#{http.converte(dados)}")
      end
    end
  end
end
