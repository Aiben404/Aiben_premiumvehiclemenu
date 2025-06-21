# Premium Vehicle Menu for FiveM

Allows players with specific Discord roles to access a premium vehicle spawn menu using ox_lib.

## Features
- Discord role check via Bot API
- ox_lib based stylish UI
- Deletes existing vehicle before spawning a new one

## Requirements
- ox_lib
- Discord Bot with GUILD_MEMBERS permission

## Installation

1. Place it in your `resources/` folder.

2. Add to `server.cfg`:
   ensure Aiben_premiumvehiclemenu

3. Create your Discord bot, copy its token and add the bot to your server with `GUILD_MEMBERS` permission.

4. Edit `config.lua` and `server.lua` line 33 to add your Guild ID and Bot Token.
