send_image <- function(image_call, chat_id, token, file = "image"){
  
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
  
  filename = paste0("./", "file", ".png")
  
  png(filename = filename)
  image_call
  dev.off()
  httr::POST(url = paste0("https://api.telegram.org/bot", token, "/sendPhoto"), 
             body = list(chat_id = chat_id, 
                         photo = httr::upload_file(filename)))
}


