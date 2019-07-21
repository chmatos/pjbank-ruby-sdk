require_relative 'base'

module PJBank
  module Conta
    class Consulta < Base
      def cadastro(dados)
        http.get("#{base_url_path}/:credencial", payload: dados)
      end

      def documentos(dados)
        http.get("#{base_url_path}/:credencial/documentos", payload: dados)
      end

      def status_socio(email)
        http.get("#{base_url_path}/:credencial/administradores/#email", payload: nil)
      end

      def administradores(email)
        http.get("#{base_url_path}/:credencial/administradores/#email", payload: nil)
      end
    end
  end
end
