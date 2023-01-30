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
