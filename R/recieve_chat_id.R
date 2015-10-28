recieve_chat_id <- function(token){
  
  x <- fromJSON(paste0("https://api.telegram.org/bot", token, "/getUpdates"))
  
  if(x$ok){
    x$result$message$from[NROW(x$result$message$from), ]
  }
  else{
    warning("no message found")
  }
  
}