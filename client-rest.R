
if(!require(rjson)) install.packages("rjson");require(rjson)
if(!require(jsonlite)) install.packages("jsonlite");require(jsonlite)

casos_url <- "https://brasil.io/api/dataset/covid19/caso/data/"
boletim_url <- "https://brasil.io/api/dataset/covid19/boletim/data/"
caso_full_url <- "https://brasil.io/api/dataset/covid19/caso_full/data/"
obito_cartorio_url <- "https://brasil.io/api/dataset/covid19/obito_cartorio/data/"

generate_table<-function(result){ #recebe como parâmetro o resultado da função
  table <- data.frame(result[["results"]]) #cria dara frame de acordo com o resultado
  if(length(table) != 0){
    if(is.null(result[["next"]]) == FALSE){ #verifica se existe mais resultados(API limita num de resultados por página)
      result_page <- fromJSON(getURL(result[["next"]])) #pega as prox. paginas
      if(is.null(result_page[["next"]]) == TRUE){
        table_page <- data.frame(result_page[["results"]])
        table <- rbind(table, table_page)
      }
      while(is.null(result_page[["next"]]) == FALSE){ 
        table_page <- data.frame(result_page[["results"]])
        table <- rbind(table, table_page)
        result_page <- fromJSON(getURL(result_page[["next"]]))
        if(is.null(result_page[["next"]]) == TRUE){
          table_page <- data.frame(result_page[["results"]])
          table <- rbind(table, table_page)
        }
      } 
    }
    
    for(i in 1:ncol(table)){
      table[,i]=iconv(table[,i], from="UTF-8", to="LATIN1")
    }
    
    return(table)
  }
  return("Nenhum resultado!")
}

casos_todos<-function(){
  result <- fromJSON(getURL(casos_url))
  return(generate_table(result))
}

casos_state<-function(is_last,place_type){
  full_url = paste0(casos_url, "?is_last=", is_last,
                    "&place_type=", place_type)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

casos_more_state<-function(is_last,state){
  full_url = paste0(casos_url, "?is_last=", is_last,
                    "&state=", state)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

casos_more_city<-function(is_last,city){
  full_url = paste0(casos_url, "?is_last=", is_last,
                    "&city=", city)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

casos_date<-function(date,state,city){
  full_url = paste0(casos_url, "?date=", date,
                    "&state=", state, "&city=", city)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

casos<-function(search,date,state,city,place_type,
                order_for_place,is_last,city_ibge_code){
  full_url = paste0(casos_url, "?search=", search, "&date=",date, 
                    "&state=", state,"&city=", city, 
                    "&place_type=", place_type, 
                    "&order_for_place=", order_for_place,
                    "&is_last=", is_last, "&city_ibge_code=", city_ibge_code)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

boletim_todos<-function(){
  result <- fromJSON(getURL(boletim_url))
  return(generate_table(result))
}

boletim<-function(search,date,state){
  full_url = paste0(boletim_url, "?search=", search, "&date=", date, 
                    "&state=", state)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

caso_full_todos<-function(){
  result <- fromJSON(getURL(caso_full_url))
  return(generate_table(result))
}

caso_full_state<-function(is_last,place_type){
  full_url = paste0(caso_full_url, "?is_last=", is_last,
                    "&place_type=", place_type)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

caso_full_more_state<-function(is_last,state){
  full_url = paste0(caso_full_url, "?is_last=", is_last,
                    "&state=", state)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

caso_full_more_city<-function(is_last,city){
  full_url = paste0(caso_full_url, "?is_last=", is_last,
                    "&city=", city)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

caso_full_date<-function(date,state,city){
  full_url = paste0(caso_full_url, "?date=", date,
                    "&state=", state, "&city=", city)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

caso_full<-function(city,city_ibge_code,date,epidemiological_week,is_last,
                    is_repeated,last_available_date,order_for_place,
                    place_type,state){
  full_url = paste0(caso_full_url, "?city=", city,
                    "&city_ibge_code=",city_ibge_code, "&date=", date,
                    "&epidemiological_week=", epidemiological_week, 
                    "&is_last=", is_last, "&is_repeated=", is_repeated,
                    "&last_available_date=", last_available_date,
                    "&order_for_place=", order_for_place, 
                    "&place_type=", place_type, "&state=", state)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}

obito_cartorio_todos<-function(){
  result <- fromJSON(getURL(obito_cartorio_url))
  return(generate_table(result))
}

obito_cartorio<-function(date,state,epidemiological_week_2019,
                         epidemiological_week_2020){
  full_url = paste0(obito_cartorio_url, "?date=", date, "&state=", state,
                    "&epidemiological_week_2019=", epidemiological_week_2019,
                    "&epidemiological_week_2020=", epidemiological_week_2020)
  full_url <- URLencode(full_url)
  result <- fromJSON(getURL(full_url))
  return(generate_table(result))
}
