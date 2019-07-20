require_relative 'base'

module PJBank
  module Conta
    class Credenciamento < Base
      def cadastrar(dados)
        http.post("#{base_url_path}/", payload: dados)
      end
    end
  end
end
