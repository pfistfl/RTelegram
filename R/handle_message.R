# Check for a new message
check_for_message = function(chat, allowed_users) {
  chat = update_chat_id(chat)
  # Only handle new messages
  if (chat$chat_id$created_on > chat$last_msg_date) {
    # Check whether the user is allowed
    stopifnot(chat$chat_id$username %in% allowed_users)
    # Handle Message from Chat
    chat = handle_message(chat)
  }
  chat$last_msg_date = chat$chat_id$created_on
  invisible(chat)
}


# Handle a message
# Current prefixed: rexec: Execute an R command
# echo: Echo the input
handle_message = function(chat) {
  # Load package, set variable cid = chat_id
  requireNamespace("stringi")
  cid = chat$chat_id

  if (grepl("rexec", cid$message, ignore.case = TRUE)) {
    print(cid$message)
    msg = execute_rcommand(cid$message)
    if (chat$echo) {
      echo = paste0(">> ", cid$message)
    }
    msg = paste0(echo, "\n", paste0(msg, collapse = ""))
  } else if (trimws(stringi::stri_trans_tolower(cid$message)) == "bot off") {
    chat$is_active = FALSE
    msg = "Turing Bot off ..."
    print(msg)
  } else if (tolower(cid$message) == "stop") {
    msg = "Bot still running, use 'bot off' to deactivate bot first."
  } else {
    print(cid$message)
    msg = "Nothing there to execute ..."
  }
  send_message(msg, cid, Sys.getenv("telegram_token"))
  return(chat)
}

# Execute an R Command.
# Needs to be prefixed by rexec
# Example: rexec rnorm(1)
execute_rcommand = function(input) {
  stringi::stri_sub(input, length = 5) <- ""
  input <- trimws(input)
  msg = tryCatch(eval(parse(text = input), envir = .GlobalEnv),
    error = function(err) {sprintf("Could not eval '%s'", input)})
}
