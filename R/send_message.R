send_message <- function(message, chat_id, token, collapse = TRUE){
  
  if(!(inherits(chat_id, "chat_id") | is.character(chat_id))){
    stop("chat_id must be a chat_id object or a character string")
  }

  if(!(inherits(token, "chat_bot") | is.character(token))){
    stop("token must be a chat_bot object or a character string")
  }
  
  if(inherits(chat_id, "chat_id")){
    chat_id <- chat_id$chat_id 
  }
  
  if(inherits(token, "chat_bot")){
    token <- token$token 
  }
  
  if(collapse){
    message <- paste(message, collapse = ", ")
  }
  
  
  httr::POST(url = paste0("https://api.telegram.org/bot", token, 
                          "/sendmessage"), body = list(chat_id = chat_id, 
                                                       text = message))
  
}

