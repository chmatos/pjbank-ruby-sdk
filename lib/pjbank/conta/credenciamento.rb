# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Credenciamento < Base
      def cadastrar(dados)
        http.post("#{base_url_path}/", payload: dados)
      end

      def convidar_administrador(dados)
        http.post("#{base_url_path}/:credencial/administradores", payload: dados)
      end

      def remover_administrador(dados)
        http.post("#{base_url_path}/:credencial", payload: dados)
      end

      def atualizar_webhook(dados)
        http.put("#{base_url_path}/:credencial", payload: dados)
      end

      def adicionar_saldo(dados)
        http.post("#{base_url_path}/:credencial", payload: dados)
      end
    end
  end
end
