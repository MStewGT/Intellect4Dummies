-- Main Lua code for Intellect4Dummies
-- Author: MStewGT

-- Returns a list of members in the player's party or raid and assigns to a variable
raidMembers = {};
partyMembers = {};
do
  for i=1,40 do
    raidMembers[i] = "raid"..i
  end
  for i=1,4 do
    partyMembers[i] = "party"..i
  end
end

-- Loop through raidMembers and check Spell Power aura for Arcane Intellect
function CheckBuffsGroup()
  local needBuff = false
  local aura = false
  local buff = "Arcane Intellect"
  local warnText = "Someone is Dumb!!"
  
  if IsInRaid() then
    for i=1, GetNumGroupMembers() do
      aura = AuraUtil.FindAuraByName(buff, raidMembers[i])
      if not aura then
        needBuff = true
        message(warnText)
        return needBuff
      end
    end
    
    elseif IsInGroup() then
      for i=1, GetNumSubgroupMembers() do
        aura = AuraUtil.FindAuraByName(buff, partyMembers[i])
        if not aura then
          needBuff = true
          message(warnText)
          return needBuff
        end
      end        
        
    else
      aura = AuraUtil.FindAuraByName(buff, "player")
      if not aura then
        needBuff = true
        message(warnText)
        return needBuff
      end
        
  end
    
end

-- Event handler
local frame = CreateFrame("FRAME", "I4DFrame")
frame:RegisterEvent("READY_CHECK")
local function eventHandler(self, event, ...)
  CheckBuffsGroup()
end
frame:SetScript("OnEvent", eventHandler)