# RClientBrasilCovid19
Cliente R que consome os dados da API https://brasil.io/api/dataset/covid19/

Todas as explicações das variáveis seguem como base as especificações da API.

As bibliotecas necessárias para a execução das funções serão instaladas automaticamente no cliente, caso seja necessário.

Boibliotecas necessárias:
require(dplyr)
require(rjson)
require(jsonlite)
require(rio)
require(RCurl)

Para utilizar as funções será necessário baixar o arquivo src e colocar no seu projeto. Com isso basta usar a função source(), para inserir o arquivo, lltere o caminho conforme for necessário.
Exemplo:
source('/src/client-rest.R')



### Funções tabela casos

#### casos_todos() 
Função para requisitar todos os casos.

Exemplo:

casos_todos()

#### casos_state() 
Função para requisitar os casos de acordo com os parâmetros is_last e place_type.

Valores possíveis: 

* is_last ("True" ou "False") 

* place_type ("city" ou "state")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

casos_state("True","city")

casos_state("","state")

casos_state("","")

####casos_more_state()
Função para requisitar os casos de acordo com os parâmetros is_last e state.

Valores possíveis: 

* is_last ("True" ou "False") 

* state (sigla do estado, exemplo "CE")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

casos_more_state("True","CE")

casos_more_state("","SP")

casos_more_state("","")

####casos_more_city()
Função para requisitar os casos de acordo com os parâmetros is_last e city.

Valores possíveis: 

* is_last ("True" ou "False") 

* city (nome do município, exemplo "Russas")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

casos_more_city("False","Guaraciaba do Norte")

casos_more_city("","Apiaí")

casos_more_city("","")

####casos_date()
Função para requisitar os casos de acordo com os parâmetros date, state e city.

Valores possíveis: 

* date (data no formato YYYY-MM-DD, exemplo "2020-04-01")

* state (sigla do estado, exemplo "MG")

* city (nome do município, exemplo "Além Paraíba")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

casos_date("2020-04-01","AM","Anori")

casos_date("2020-03-28","SP","")

casos_date("","","")

####casos()
Função para requisitar os casos de acordo com os parâmetros search, date, state, city, place_type, order_for_place, is_last e city_ibge_code.

Valores possíveis: 

* search (valor parar buscar, exemplo "Jaru")

* date (data no formato YYYY-MM-DD, exemplo "2020-04-01")

* state (sigla do estado, exemplo "MG")

* city (nome do município, exemplo "Além Paraíba")

* place_type ("city" ou "state")

* order_for_place (número inteiro, exemplo "10")

* is_last ("True" ou "False") 


* city_ibge_code (código IBGE do local, exemplo "1100122")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

casos("Jaru","2020-04-01","RO","Jaru","city","1","True","1100114")

casos("","","","","","","","")

### Funções tabela boletim

#### boletim_todos() 
Função para requisitar todos os boletins.

Exemplo:

boletim_todos()

####boletim()
Função para requisitar os casos de acordo com os parâmetros search, date e state.

Valores possíveis: 

* search (valor parar buscar, exemplo "Estado")

* date (data no formato YYYY-MM-DD, exemplo "2020-04-01")

* state (sigla do estado, exemplo "MG")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

boletim("registro","2020-05-06","MT")

boletim("município","","SP")

boletim("","","")

### Funções tabela caso_full

#### caso_full_todos() 
Função para requisitar todos os casos full.

Exemplo:

caso_full_todos()

####caso_full_state()
Função para requisitar os casos full de acordo com os parâmetros is_last e place_type.

Valores possíveis: 

* is_last ("True" ou "False") 

* place_type ("city" ou "state")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

caso_full_state("True","city")

caso_full_state("","state")

caso_full_state("","")

####caso_full_more_state()
Função para requisitar os casos full de acordo com os parâmetros is_last e state.

Valores possíveis: 
* is_last ("True" ou "False") 

* state (sigla do estado, exemplo "CE")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

caso_full_more_state("True","CE")

caso_full_more_state("","SP")

caso_full_more_state("","")

####caso_full_more_city()
Função para requisitar os casos full de acordo com os parâmetros is_last e city.

Valores possíveis: 
* is_last ("True" ou "False") 

* city (nome do município, exemplo "Russas")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

caso_full_more_city("False","Guaraciaba do Norte")

caso_full_more_city("","Apiaí")

caso_full_more_city("","")

####caso_full_date()
Função para requisitar os casos full de acordo com os parâmetros date, state e city.

Valores possíveis: 
* date (data no formato YYYY-MM-DD, exemplo "2020-04-01")

* state (sigla do estado, exemplo "MG")

* city (nome do município, exemplo "Além Paraíba")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

caso_full_date("2020-04-01","AM","Anori")

caso_full_date("2020-03-28","SP","")

caso_full_date("","","")

####caso_full()
Função para requisitar os casos de acordo com os parâmetros search, date, state, city, place_type, order_for_place, is_last e city_ibge_code.

Valores possíveis: 

* city (nome do município, exemplo "Além Paraíba")

* city_ibge_code (código IBGE do local, exemplo "1100122")

* date (data no formato YYYY-MM-DD, exemplo "2020-04-01")

* epidemiological_week (número inteiro, exemplo "20")

* is_last ("True" ou "False") 

* is_repeated ("True" ou "False")

* last_available_date (data no formato YYYY-MM-DD, exemplo "2020-04-01")

* order_for_place (número inteiro, exemplo "10")

* place_type ("city" ou "state")

* state (sigla do estado, exemplo "MG")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

caso_full("Acrelândia","1200013","2020-05-11","20","True","False","2020-05-10","44","city","AC")

caso_full("","","","","","","","","","")

### Funções tabela obito_cartorio

#### obito_cartorio_todos() 
Função para requisitar todos os óbitos registrados em cartório.

Exemplo:

obito_cartorio_todos()

#### obito_cartorio() 
Função para requisitar os óbitos registrados em cartório de acordo com os parâmetros date, state, epidemiological_week_2019 e epidemiological_week_2020.

Valores possíveis: 

* date (data no formato YYYY-MM-DD, exemplo "2020-04-01")

* state (sigla do estado, exemplo "MG")

* epidemiological_week_2019 (número inteiro, exemplo "20")

* epidemiological_week_2020 (número inteiro, exemplo "20")

Obs.: os parâmetros podem ser passados como vazios "".

Exemplos:

obito_cartorio("2020-05-12","AC","20","20")

obito_cartorio("município","","SP")

obito_cartorio("","","")

Documentação: https://htmlpreview.github.io/?https://github.com/ltiufc/RClientBrasilCovid19/blob/master/doc/documentacao.html

Fonte: Secretarias de Saúde das Unidades Federativas, dados tratados por Álvaro Justen e colaboradores/Brasil.IO.

API: https://github.com/turicas/covid19-br/blob/master/api.md

Bibliotecas:

dplyr (https://cran.r-project.org/web/packages/dplyr/index.html)

rjson (https://cran.r-project.org/web/packages/rjson/rjson.pdf)

jsonlite (https://cran.r-project.org/web/packages/jsonlite/jsonlite.pdf)

rio (https://cran.r-project.org/web/packages/rio/rio.pdf)

RCurl (https://cran.r-project.org/web/packages/RCurl/RCurl.pdf)
