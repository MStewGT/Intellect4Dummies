# Intellect 4 Dummies

## About

Author: MStewGT\
Blog: [Jack of all Admins](http://www.jackofalladmins.com) (*Under Construction*)\
Version: 0.4\
Description: Simple addon to warn if a member of your party/raid does not have the Arcane Intellect buff

## Notes

In the current version the check must be kicked off manually using the function.

## To Do

- [x] Add an event handler to monitor for a ready check and run buff check
- [x] Move buff name and warning text to variables
- [x] Test event handler code
- [ ] Test all possible raid/party/solo situations function as intended
- [ ] Add sound effect
- [ ] Generate a nicer warning message instead of default message box

## Instructions

Download files and place in a ...\World of Warcraft\Interface\AddOns\Intellect4Dummies folder.

If you want to change the buff to check for or the warning message just edit the lines below in *main.lua*

```lua
local buff = "Arcane Intellect"
local warnText = "Someone is Dumb!!"
```