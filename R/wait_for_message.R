activate_chat = function(allowed_users, sleep_time = 5) {
  chat = make_chat()
  print("Activated Bot ...")

  while (chat$is_active) {
    Sys.sleep(sleep_time)
    chat = check_for_message(chat, allowed_users)
  }
}

# Get updates
make_chat = function() {
  chat = list(chat_id = recieve_chat_id(Sys.getenv("telegram_token")),
    output = NULL,
    input = NULL,
    last_msg_date = Sys.time(),
    is_active = TRUE,
    echo = TRUE)
  send_message("Activated Chat Bot", chat$chat_id, Sys.getenv("telegram_token"))
  class(chat) = "telegram_chat"
  return(chat)
}

update_chat_id = function(chat) {
  # Update the chat id
  chat$chat_id = recieve_chat_id(Sys.getenv("telegram_token"))
  return(chat)
}

# Listen to bot activation.
# bot on listens
listen = function(allowed_users, sleep_time = 120L) {
  cid = recieve_chat_id(Sys.getenv("telegram_token"))
  bot_start = cid$created_on
  send_message("Started Listening ...", cid, Sys.getenv("telegram_token"))
  active = TRUE
  while (active) {
    cid = recieve_chat_id(Sys.getenv("telegram_token"))
    if (tolower(cid$message) == "bot on") {
      activate_chat(allowed_users)
    } else if (tolower(cid$message) == "stop" & cid$created_on > bot_start) {
      active = FALSE
      send_message("Stopped Listening ...", cid, Sys.getenv("telegram_token"))
    }
    Sys.sleep(sleep_time)
  }
}



