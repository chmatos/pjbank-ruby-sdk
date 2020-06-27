require 'pjbank'
require 'pp'
require 'pry-byebug'

PJBank.configuracao.env = 'production'
# client = PJBank::Client.new # (credencial: '8095e55f1c3e972ab62f2846941ad28eeb5cc02c', chave: 'a9007b0bc3126dec4988a950d4922ac4c9e587e0')
# cont = PJBank::ContaDigital.new
# cont.credenciamento
# exit

####################################################################################################
# Credenciar uma Empresa na Conta Digital
####################################################################################################
# puts "(100) Credenciando uma empresa..."
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
credencial = 'd3b3fce6913d88b1ec2eebe9470235b1291b952f6290' # B2B Producao
chave      = '6d4e1dasgnjb24f95a1bb0bd4acce7f502c0261422503b' # B2B Producao
# credencial = '085dbgnyh20da07bbe4d71fcb500dcb4b0dafe9943d0a' # B2B Producao
# chave      = 'fa6a1ad2f65f45ea00a39372dde6ujca2114a4d26b621d' # B2B Producao
client = PJBank::Client.new(credencial: credencial, chave: chave)

####################################################################################################
# Convidar um Administrador
####################################################################################################
# puts "(200) Convidando Administrador #{credencial}..."
# response = client.conta.consulta.cadastro(nil)
# puts response
# puts ' '

####################################################################################################
# Consulta Cadastro da Conta Digital
####################################################################################################
puts "(300) Consultando Conta Digital Credencial=#{credencial}..."
response = client.conta.consulta.cadastro
puts response
puts ' '

####################################################################################################
# Consulta Extrato da Conta Digital
####################################################################################################
# puts "(40)Consultando Extrato da Conta Digital Credencial #{credencial}..."
# response = client.conta.transacao.extrato(
#   {
#     "data_inicio": "07/01/2019",
#     "data_fim": "07/21/2019",
#     "formato": "json",
#     "com_saldo": "true"
#   }
# )
# puts response
# puts ' '

####################################################################################################
# Adicionar Saldo na Conta Digital
####################################################################################################
# puts "(500) Adcionando Saldo Credencial #{credencial}..."
# response = client.conta.credenciamento.adicionar_saldo({ "valor": 1000.00 })
# puts response
# puts ' '


####################################################################################################
# Criar uma SubConta na Conta Digital
####################################################################################################
# puts "(600) Criando uma SubConta na Conta Digital Credencial=#{credencial}..."
# response = client.conta.subconta.criar(
#   {
#     "nome_cartao": "Christisno Matos",
#     "cnpj": "89934105772",
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
#     "sexo": "M",
#     "tipo": "cartao_corporativo",
#     "data_nascimento": "12/31/1970",
#     "valor": 1000.00
#   }
# )
# puts response
# puts ' '

####################################################################################################
# Consulta SubConta da Conta Digital
####################################################################################################
# # subconta = response.subconta
# subconta = '5d81e3e647707b790f3f8e60516e5294f41b16bf' # response.subconta
# puts "(700) Consultando SubConta #{subconta}..."
# response = client.conta.subconta.consultar(subconta, com_saldo: false)
# puts response
# puts ' '

####################################################################################################
# Consulta Extrato da SubConta da Conta Digital
####################################################################################################
# # subconta = response.subconta
# subconta = '5d81e3e647707b790f3f8e60516e5294f41b16bf' # response.subconta
# puts "(800) Consultando Extrato da SubConta #{subconta}..."
# response = client.conta.subconta.extrato(subconta,
#   {
#     "data_inicio": "04/01/2020",
#     "data_fim": "04/29/2020",
#     "formato": "json",
#     "com_saldo": "true"
#   }
# )
# puts response
# puts ' '
# exit

####################################################################################################
# Cria Boleto na Conta Digital
####################################################################################################
puts "(900) Criando Boleto na Conta Digital Credencial=#{credencial}..."
response = client.conta.recebimento.boleto.criar(
  {
    "vencimento": "12/31/2020",
    "valor": 40.41,
    "juros": 0,
    "multa": 0,
    "desconto": "",
    "nome_cliente": "Cliente de Exemplo",
    "cpf_cliente": "62936576000112",
    "endereco_cliente": "Rua Joaquim Vilac",
    "numero_cliente": "509",
    "complemento_cliente": "",
    "bairro_cliente": "Vila Teixeira",
    "cidade_cliente": "Campinas",
    "estado_cliente": "SP",
    "cep_cliente": "13301510",
    "logo_url": "http://wallpapercave.com/wp/xK64fR4.jpg",
    "texto": "Exemplo de emissão de boleto",
    "grupo": "Boletos",
    "pedido_numero": "999999999999996"
  }
)
puts response
puts ' '
puts ' '
puts ' '
puts ' '
puts ' '
puts ' '
boleto = response.id_unico
boleto = '99999999999990000016'

####################################################################################################
# Imprime Boleto da Conta Digital
####################################################################################################
# puts "(1000) Imprimindo Boleto da Conta Digital Boleto=#{boleto}..."
# response = client.conta.recebimento.boleto.imprimir({ "pedido_numero": [boleto] })
# puts response
# puts ' '

####################################################################################################
# Cria Token de Cartao na Conta Digital
####################################################################################################
# puts "(1100) Criando Token de Cartao na Conta Digital Credencial=#{credencial}..."
# response = client.conta.recebimento.cartao.criar_token(
#   {
#     "nome_cartao": "Cliente Exemplo",
#     "numero_cartao": "4012001037141112",
#     "mes_vencimento": "05",
#     "ano_vencimento": "2018",
#     "cpf_cartao": "64111456529",
#     "email_cartao": "api@pjbank.com.br",
#     "celular_cartao": "978456723",
#     "codigo_cvv": "123"
#   }
# )
# puts response
# puts ' '
# token = response.token_cartao

####################################################################################################
# Capturando Cartao na Conta Digital
####################################################################################################
# puts "(1200) Capturando Cartao na Conta Digital Token=#{token}..."
# response = client.conta.recebimento.cartao.capturar(
#   {
#     "descricao_pagamento": "Pagamento de teste",
#     "valor": 1200,
#     "parcelas": 12,
#     "token_cartao": token
#   }
# )
# puts response
# puts ' '
# cartao = response.token_cartao

####################################################################################################
# Consulta Extrato de Recebimentos da Conta Digital
####################################################################################################
puts "Consultando Recebimentos da Conta Digital Credencial=#{credencial}..."
response = client.conta.recebimento.extrato(
  {
    "data_inicio": "01/01/2020",
    "data_fim": "12/31/2060"
  }
)
puts response
puts ' '

####################################################################################################
# Cancela Boleto da Conta Digital
####################################################################################################
# boleto = '99999999999990000016'
# puts "(1300) Cancelando Boleto da Conta Digital Boleto=#{boleto}..."
# response = client.conta.recebimento.cancelar(boleto)
# puts response
# puts ' '

####################################################################################################
# Cancela Captura de Cartao da Conta Digital
####################################################################################################
# puts "(1400) Cancelando Captura de Cartao da Conta Digital Cartao=#{cartao}..."
# response = client.conta.recebimento.cancelar(cartao)
# puts response
# puts ' '

