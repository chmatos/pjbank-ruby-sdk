# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Consulta < Base
      def cadastro
        http.get("#{base_url_path}/:credencial", payload: nil)
      end

      def documentos
        http.get("#{base_url_path}/:credencial/documentos", payload: nil)
      end

      def status_socio(email)
        http.get("#{base_url_path}/:credencial/administradores/#{email}", payload: nil)
      end

      def administradores
        http.get("#{base_url_path}/:credencial/administradores", payload: nil)
      end
    end
  end
end
