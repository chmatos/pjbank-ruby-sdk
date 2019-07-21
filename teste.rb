require 'pjbank'
require 'pp'
require 'pry-byebug'

PJBank.configuracao.env = 'sandbox'
client = PJBank::Client.new # (credencial: '8095e55f1c3e972ab62f2846941ad28eeb5cc02c', chave: 'a9007b0bc3126dec4988a950d4922ac4c9e587e0')

####################################################################################################
# Credenciar uma Empresa na Conta Digital
####################################################################################################
# response = client.conta.credenciamento.cadastrar(
#   {
#     "nome_empresa": "Exemplo Conta Digital",
#     "cnpj": "37772131000105",
#     "cep": "13032525",
#     "endereco": "Rua Joaquim Vilac",
#     "numero": "509",
#     "bairro": "Vila Teixeira",
#     "complemento": "",
#     "cidade": "Campinas",
#     "estado": "SP",
#     "ddd": "19",
#     "telefone": "987652345",
#     "email": "api@pjbank.com.br",
#     "webhook": "http://example.com.br"
#   }
# )
# puts response

####################################################################################################
# Seta client
####################################################################################################
credencial = response.credencial.presence || '8095e55f1c3e972ab62f2846941ad28eeb5cc02c'
chave      = response.chave.presence || 'a9007b0bc3126dec4988a950d4922ac4c9e587e0'
client = PJBank::Client.new(credencial: credencial, chave: chave)

####################################################################################################
# Convidar um Administrador
####################################################################################################
puts "Convidando Administrador #{credencial}..."
response = client.conta.consulta.cadastro(nil)
puts response
puts ' '

####################################################################################################
# Consulta Cadastro da Conta Digital
####################################################################################################
puts "Consultando Credencial #{credencial}..."
response = client.conta.consulta.cadastro(nil)
puts response
puts ' '

