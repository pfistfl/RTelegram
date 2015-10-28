validate_bot <- function(token){
  
  bot <- list()
  
  x <- fromJSON(paste0("https://api.telegram.org/bot", token, "/getME"))
  
  if(!x$ok){
    warning("bot not found")
  }
  else{
    
    bot$token <- token
    bot$chat_id <- x$result$id
    bot$username <- x$result$username
    bot$first_name <- x$result$first_name
  }
  
  class(bot) <- "chat_bot"
  bot
  
}