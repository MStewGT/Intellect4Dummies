-- Main Lua code for Intellect4Dummies
-- Author: MStewGT
-- Version: 1.3

-- Returns a list of members in the player's party or raid and assigns to a variable
local raidMembers = {};
local partyMembers = {};
do
  for i=1,40 do
    raidMembers[i] = "raid"..i
  end
  for i=1,4 do
    partyMembers[i] = "party"..i
  end
end

-- Loop through raidMembers and check Arcane Intellect buff/aura
function CheckBuffsGroup()

  -- Define local variables
  local aura = false
  local buff = "Arcane Intellect"
  local warnText = "Someone is Dumb!!"
  local soundFile = "12867"

  -- Check if in a raid first
  if IsInRaid() then
    -- Loop through raid members
    for i=1, GetNumGroupMembers() do
      -- Check for buff
      aura = AuraUtil.FindAuraByName(buff, raidMembers[i])
      -- If buff is not present then warn
      if not aura then
        message(warnText)
        PlaySound(soundFile)
        return aura
      end
    end

  -- If not in a raid check if in a party
  elseif IsInGroup() then
    -- Loop through party members
    for i=1, GetNumSubgroupMembers() do
      -- Check for buff
      aura = AuraUtil.FindAuraByName(buff, partyMembers[i])
      -- If buff is not present then warn
      if not aura then
        message(warnText)
        PlaySound(soundFile)
        return aura
      end
    end

  -- If all else fails you must be solo, only usable via debugger
  else
    -- Check for buff
    aura = AuraUtil.FindAuraByName(buff, "player")
    -- If buff is not present then warn
    if not aura then
      message(warnText)
      PlaySound(soundFile)
      return aura
    end

  end

end

-- Event handler
local frame = CreateFrame("FRAME", "I4DFrame")
frame:RegisterEvent("READY_CHECK")  -- Listens for a Ready Check
local function eventHandler(self, event, ...)
  CheckBuffsGroup()  -- Runs buff check on event
end
frame:SetScript("OnEvent", eventHandler)