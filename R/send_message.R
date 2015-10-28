send_message <- function(message, chat_id, token){
  
  if(!(inherits(chat_id, "chat_id") | is.character(chat_id))){
    error("chat_id must be a chat_id object or a character string")
  }

  
  if(inherits(chat_id, "chat_id")){
    chat_id <- chat_id$chat_id 
  }
  
  
  httr::POST(url = paste0("https://api.telegram.org/bot", token, 
                          "/sendmessage"), body = list(chat_id = chat_id, 
                                                       text = "nice"))
  
}

