# Intellect 4 Dummies

## About

Author: MStewGT\
Blog: [Jack of all Admins](http://www.jackofalladmins.com)\
Version: 1.3\
Description: Simple addon to warn if a member of your party/raid does not have the Arcane Intellect buff

## Notes

Addon will verify that all party/raid members have the Arcane Intellect buff when a Ready Check is started.\
Extensively raid tested, could use further testing in parties.

## To Do

- [x] Add an event handler to monitor for a ready check and run buff check
- [x] Move buff name and warning text to variables
- [x] Test event handler code
- [x] Test all possible raid/party/solo situations function as intended
- [x] Add sound effect
- [ ] Generate a nicer warning message instead of default message box
- [ ] Add the ability to configure the addon to check for other buffs

## Instructions

Download files and place in a ...\World of Warcraft\Interface\AddOns\Intellect4Dummies folder.

If you want to change the buff to check for, or the warning message, just edit the lines below in *main.lua*

```lua
local buff = "Arcane Intellect"
local warnText = "Someone is Dumb!!"
```
