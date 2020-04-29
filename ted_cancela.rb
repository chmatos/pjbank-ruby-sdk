require 'pjbank'
require 'pp'
# require 'pry-byebug'

PJBank.configuracao.env = 'sandbox'

####################################################################################################
# Seta client
####################################################################################################
credencial = '8095e55f1c3e972ab62f2846941ad28eeb5cc02c'
chave      = 'a9007b0bc3126dec4988a950d4922ac4c9e587e0'
client = PJBank::Client.new(credencial: credencial, chave: chave)

####################################################################################################
# Cria TED na Conta Digital
####################################################################################################
 puts "(100) Criando Boleto na Conta Digital Credencial=#{credencial}..."
 response = client.conta.transacao.criar(
  {
    "lote": [
      {
        "data_vencimento": '04/07/2020',
        "data_pagamento": '04/07/2020',
        "valor": 50.32,
        "banco_favorecido": '341',
        "agencia_favorecido": '3830',
        "conta_favorecido": '068759',
        "cnpj_favorecido": '89934105772',
        "nome_favorecido": 'Christiano Matos',
        "descricao": 'Teste',
        "solicitante": '', # @current_user.name,
        "tipo_conta_favorecido": 'corrente'
      }
    ]
  }
 )
 puts response
 puts ' '

 if response.status == '201'
  begin
    response = client.conta.transacao.cancelar(response.id_operacao)
    puts response
    puts response.data['id_operacao']
    puts ' '
  rescue StandardError => e
    puts "Erro no cancelamento do TED: #{e.message}"
  end
 end
