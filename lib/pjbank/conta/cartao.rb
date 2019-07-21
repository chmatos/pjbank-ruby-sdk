# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class Recebimento
      class Cartao < Base
        def criar_token(dados)
          http.post("#{base_url_path}/:credencial/recebimentos/tokens", payload: dados)
        end

        def capturar(dados)
          http.post("#{base_url_path}/:credencial/recebimentos/transacoes", payload: dados)
        end
      end
    end
  end
end
