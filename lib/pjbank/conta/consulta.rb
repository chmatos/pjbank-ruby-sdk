require_relative 'base'

module PJBank
  module Conta
    class Consulta < Base
      def cadastro(dados)
        http.get("#{base_url_path}/:credencial", payload: dados)
      end
    end
  end
end
