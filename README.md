# Roteamento

## Execução do trabalho
**_Topologia 01_**
> Linux 
```
./script-static.sh
```
> Windows WSL 
```
bash script-static.sh
```
**_Topologia 02_**
> Linux 
```
./script-rip.sh
```
> Windows WSL 
```
bash script-rip.sh
```
Para finalizar ambas as Topologias basta executar o script abaixo:
> Linux 
```
./script-stop.sh
```
> Windows WSL 
```
bash script-stop.sh
```
para ter acesso aos roteadores abra outro terminal e em seguida execute o telnet correspondente ao roteador que desejar acessar, logo abaixo temos uma lista da porta de cada roteador para qualquer topologia, no entando a topologia 02 não possue o roteador 5:

- Roteador 1 -> Porta:(**1123**)
- Roteador 2 -> Porta:(**2223**)
- Roteador 3 -> Porta:(**3323**)
- Roteador 4 -> Porta:(**4423**)
- Roteador 5 -> Porta:(**5523**)

## Comandos executados no trabalho
Para se elaborar toda a analise do trabalho alguns comandos do freelink foram utilizado


Ping para testar a conecção entre os roteadores:
```
ping <ip> /vrf v1
```
Traceroute para analizar a rota que o pacote esta fazendo para trafegar de um roteador para o outro: 
```
traceroute <ip> /vrf v1
```
Comando para print da tabela de roteamento ipv4 e ipv6
```
show ipv4 route v1
show ipv6 route v1
```
E por fim linha de comando dentro do roteador para efetuar o desligamento de um enlace 
```
conf t
int <eth escolhido>
shutdown
```
# Elaboração da rede
**Arthur Coelho Estevão (2019109953)**:
- ipv4 =  201.91.xxx.xx - partindo de 201.91.99.53
- ipv6 =  2019:1xx::xx  - partindo de 2019:1099::53

**Milena da Silva Mantovanelli (2019109068)**:
- ipv4 =  201.91.xxx.xx - partindo de 201.91.90.68
- ipv6 =  2019:1xx::xx  - partindo de 2019:1090::68
a matricula escolhida para utilização no trabalho foi a do aluno Arthur 2019109953.
# Topologia 01
Na topologia 1, temos uma rede com 5 elementos, implementada com roteamento estático.

(imagem da topologia criada)

Mostrando a tabela de rotas para o **ipv4** e **ipv6**:
```
show ipv4 route v1
show ipv6 route v1
```
**R1:**

![r1-route](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/r1%20route.jpg)

**R2:**

![r2-route](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/r2%20route.jpg)

**R3:**

![r3-route](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/r3%20route.jpg)

**R4:**

![r4-route](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/r4%20route.jpg)

**R5:**

![r5-route](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/r5%20route.jpg)

Testando **ping** e **traceroute** no roteador **R1** para o roteador **R5** por **ipv4**:
```
ping 201.91.102.54 /vrf v1
traceroute 201.91.102.54 /vrf v1
```
![ping-traceroute-r1-r5-ipv4](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/ping-traceroute-r1-r5-ipv4.jpg)
Testando **ping** e **traceroute** no roteador **R1** para o roteador **R5** por **ipv6**:
```
ping 2019:1102::54 /vrf v1
traceroute 2019:1102::54 /vrf v1
```
![ping-traceroute-r1-r5-ipv6](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/ping-traceroute-r1-r5-ipv6.jpg)

como podemos observa leva cerca de 3 saltos para que o pacote chegue de **R1** até **R5**, pois o pacote precisa trafegar até a porta do **R2(201.101.54/2019:1101::54)** pela eth1 e **R4(201.102.54/2019:1102::54)** pela eth3.

Desligando a interface eth1 do **R2**:
```
conf t
int eth1
shutdown
```
Testando novamente **ping** e **traceroute** entre **R1** -> **R5** (após desligar **eth1** do **R2**):
![ping-traceroute-r1-r5-ipv4-ipv6](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/ping-traceroute-r1-r5-ipv4-ipv6.jpg)
Testando novamente **ping** e **traceroute** entre **R5** -> **R1** (após desligar **eth1** do **R2**):
![ping-traceroute-r5-r1-ipv4-ipv6](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-01/ping-traceroute-r5-r1-ipv4-ipv6.jpg)

Observa-se que os pacotes não chegam mais até R5 a partir de R1, levando a um traceroute diretamente nulo pois não sai pacotes de **R1** já do contrario **R5** -> **R1** conseguimos ver que o pacote trafega até **R2** sem perdas porém logo é perdido por conta do **eth1** esta desligado, quando a interface é religado o envio de pacotes volta a normalidade.
