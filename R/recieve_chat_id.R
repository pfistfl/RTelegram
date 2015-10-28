recieve_chat_id <- function(token){
  
  chat_id <- list()
  
  x <- fromJSON(paste0("https://api.telegram.org/bot", token, "/getUpdates"))
  
  if(!x$ok){
    warning("no message found")
  }
  else{
    chat_id$chat_id <- x$result$message$from[NROW(x$result$message$from), 1]
    chat_id$username <- x$result$message$from[NROW(x$result$message$from), 2]
    chat_id$created_on <- as.POSIXct(tail(x$result$message$date, 1), 
                                     origin="1970-01-01")
  }
  
  class(chat_id) <- "chat_id"
  chat_id
}

