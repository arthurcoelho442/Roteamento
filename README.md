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

# Topologia 01
Na topologia 2, temos uma rede com 4 elementos, implementada com roteamento dinamico.


(imagem da topologia criada)

Mostrando a tabela de rotas para o **ipv4** e **ipv6** antes e após criação das rotas dinamicas:

**R1:**

::::**_Antes_** ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: **_Depois_**::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
| <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r1-route-antes.jpg" width=1000><br> | <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r1-route-depois.jpg" width=1000><br>|
| :---: | :---: |

**R2:**

::::**_Antes_** ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: **_Depois_**::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
| <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r2-route-antes.jpg" width=1000><br> | <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r2-route-depois.jpg" width=1000><br>|
| :---: | :---: |

**R3:**

::::**_Antes_** ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: **_Depois_**::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
| <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r3-route-antes.jpg" width=1000><br> | <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r3-route-depois.jpg" width=1000><br>|
| :---: | :---: |

**R4:**

::::**_Antes_** ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: **_Depois_**::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
| <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r4-route-antes.jpg" width=1000><br> | <img src="https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r4-route-depois.jpg" width=1000><br>|
| :---: | :---: |

Podemos ver no terminal dos roteadores o aviso de que chega um _"datagram"_ que os vizinhos estão _"up"_ indicando que o roteamento dinamico foi concluido
![datagram](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/datagram%20up.png)


Testando **ping** e **traceroute** no roteador **R1** para o roteador **R4** por **ipv4** e **ipv6**:
```
ping 201.91.102.54 /vrf v1
traceroute 201.91.102.54 /vrf v1
```
![ping-traceroute-r1-r4-ipv4-ipv6](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/ping-traceroute-r1-r4-ipv4-ipv6.jpg)

logo vemos o pacote pecorrer uma distancia direta de ligação entre o roteador 1 e o roteador 4

Desligando a interface eth1 do **R4**:
```
conf t
int eth1
shutdown
```
Podemos observar que em **R4** e em **R1** houve um aviso no terminal, mostrando que os vizinhos **(201.91.100.(53/54)** e **(2019::1100::(53/54))** "caíram" ("down"):
![warning-r4-down-eth1](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/warning-r4-down-eth1.jpg)

Testando novamente o **ping** e **traceroute** no roteador **R1** para o roteador **R4** por **ipv4** e **ipv6**:
![ping-traceroute-r1-r4-ipv4-ipv6-down](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/ping-traceroute-r1-r4-ipv4-ipv6-down.jpg)
Testando novamente o **ping** e **traceroute** no roteador **R4** para o roteador **R1** por **ipv4** e **ipv6**:
![ping-traceroute-r4-r1-ipv4-ipv6-down](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/ping-traceroute-r4-r1-ipv4-ipv6-down.jpg)

podemos observar que o transito entre **R1** e **R4** esta rompido partindo de **R1** porem quando partimos de **R4** o roteador consegue comunicação com **R1** passando pelo rodeador **R2**, como mostra a nova tabela de roteamento de **R4**, quando a rota é religada o pacote torna a passar pelo enlace entre **R1** e **R4**.

![r4-route-depois-down](https://github.com/arthurcoelho442/Roteamento/blob/main/Imagens/Topologia-02/r4-route-depois-down.jpg)

# Autores
| [<img src="https://avatars.githubusercontent.com/u/56831082?v=4" width=115><br><sub>Arthur Coelho Estevão</sub>](https://github.com/arthurcoelho442) |  [<img src="https://avatars.githubusercontent.com/u/56406192?v=4" width=115><br><sub>Milena da Silva Mantovanelli</sub>](https://github.com/Milena0899) |
| :---: | :---: |
