# RTelegram

**The project is still in an early phase, but some basic functionality is already working**.

This is essentially a wrapper for the [telegram bot API](https://core.telegram.org/bots/api).

The idea is to use the [telegram bot API](https://core.telegram.org/bots/api) to send

* Simulation status and results
* Crash logs
* images

directly from R to your smartphone.



## Installation

You can install the package directly from github with the `devtools` package:

    library(devtools)
    install.github("https://github.com/ja-thomas/RTelegram")

Or you can just clone this repository and load it in R via:
    
    library(devtools)
    load_all("[path]/RTelegram")


## Basic usage

To create a bot you first have to use the [botfather](https://telegram.me/botfather). 
For an in depth introduction on how to create a bot visit the [telegram bot FAQ](https://core.telegram.org/bots).

After creating a bot you recieve a `token`.

You can check if your bot works with the `validate_bot()` function



For security reasons bots are only allowed to send messages to real accounts after they recieved a message from that person.
After sending your bot a message from your telegram app, you can call `recieve_chat_id()` to get your `chat_id`.

Only with the correct `token` and `chat_id` you are able to send messages from R to your smartphone.


Now you can send messages with `send_message()` and images with `send_image()`.









