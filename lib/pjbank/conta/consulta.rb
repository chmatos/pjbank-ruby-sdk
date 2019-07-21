# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Consulta < Base
      def cadastro(com_saldo: nil)
        tipo = com_saldo ? "?com_saldo=true" : ''
        http.get("#{base_url_path}/:credencial#{tipo}")
      end

      def documentos
        http.get("#{base_url_path}/:credencial/documentos")
      end

      def socio(email)
        http.get("#{base_url_path}/:credencial/administradores/#{email}")
      end

      def administradores
        http.get("#{base_url_path}/:credencial/administradores")
      end
    end
  end
end
