local KosmoQueue =""
function KosmoCast_OnEvent()
  if(event == "SPELLCAST_START") then
    KosmoQueue = arg1;
  else
    KosmoQueue = arg2;
  end
end


function KosmoCast_OnLoad()
    KosmoCast_AddOnFrame:SetScript("OnUpdate", nil);
    KosmoCast_AddOnFrame:SetScript("OnEvent", KosmoCast_OnEvent);
    KosmoCast_AddOnFrame:RegisterEvent("SPELLCAST_CHANNEL_START");
    KosmoCast_AddOnFrame:RegisterEvent("SPELLCAST_START");
end

local frame = CreateFrame("Frame", "KosmoCast_AddOnFrame");
KosmoCast_AddOnFrame:SetScript("OnUpdate", KosmoCast_OnLoad);

function KosmoCast(spell)
  if(KosmoQueue ~= spell) then
    SpellStopCasting();
    KosmoQueue = spell;
  end
  CastSpellByName(spell);
end
