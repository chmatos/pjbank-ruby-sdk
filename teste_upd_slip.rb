require "uri"
require "net/http"

url = URI("https://api.pjbank.com.br/contadigital/d3b3fce6913d88sadab1ec2eebe947012nnu891b952f6290/recebimentos/transacoes")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/x-www-form-urlencoded"
request["Cookie"] = "PHPSESSID=pv0dmoki0dp7p7li58qaqcu2i0"
request.body = "vencimento=12/29/2020&valor=22.22&juros=1&multa=2&desconto=&nome_cliente=Christiano%20Matos&cpf_cliente=89934105772&endereco_cliente=R%20JOSE%20CANDIDO%20DA%20SILVA&numero_cliente=38&cidade_cliente=FLORIANOPOLIS&estado_cliente=SC&cep_cliente=88075250&texto=Patroc%EDnio%20Gerais%5Cn%5Cn1%20Patroc%EDnio%20Gerais%205.000%2C00&grupo=Boletos&pedido_numero=99999999999990000016"

response = https.request(request)
puts response.read_body