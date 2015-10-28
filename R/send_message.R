send_message <- function(message, chat_id, token){
  
  httr::POST(url = paste0("https://api.telegram.org/bot", token, "/sendmessage"),
             body = list(chat_id = chat_id, text = "nice"))
  
}

