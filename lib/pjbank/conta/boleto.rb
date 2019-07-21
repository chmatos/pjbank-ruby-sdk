# frozen_string_literal: true

require_relative 'base'

module PJBank
  module Conta
    class  Recebimento
      class Boleto < Base
        def criar(dados)
          http.post("#{base_url_path}/:credencial/recebimentos/transacoes", payload: dados)
        end

        def imprimir(dados)
          http.post("#{base_url_path}/:credencial/recebimentos/transacoes/lotes", payload: dados)
        end
      end
    end
  end
end
