local version = "1.1" -- Don't touch ! Pas Touche !
local ranksAdmins = { ["superadmin"] = true }

function enzoFR60_CVoiture_Notify(ply, pType, pTime, pMsg)
	if not IsValid(ply) then return end
	if DarkRP then DarkRP.notify(ply, tonumber(pType), tonumber(pTime), string.Trim(pMsg))
	else ply:PrintMessage(HUD_PRINTTALK, string.Trim(pMsg)) end
end

local function parsingVersion(pVersion)
  return tonumber(string.Replace(tostring(pVersion), ".", ""))
end

local function checkVersion(ply)
  if not IsValid(ply) then return end
  if ranksAdmins[ply:GetUserGroup()] and enzoFR60.CVoiture.CheckVersionAddon then
    http.Fetch("https://raw.githubusercontent.com/enzoFR60/enzoFR60_CVoiture/master/version.txt",
    	function(body, len, headers, code)
      	if code == 404 then
     	  	timer.Simple(300, function() if IsValid(ply) then checkVersion(ply) end end)
       	 	enzoFR60_CVoiture_Notify(ply, 1, 20, "[CVoiture] " .. tostring(enzoFR60.CVoiture.LanguageCheckVersionError))
          return
        end
        
				if parsingVersion(string.Trim(body)) > parsingVersion(version) then
        	enzoFR60_CVoiture_Notify(ply, 1, 20, "[CVoiture] " .. tostring(enzoFR60.CVoiture.LanguageCheckVersionNonValide))
				end
			end,
      function(err)
    	end)
  end
end

hook.Add( "PlayerInitialSpawn", "InitialVersionCheckCVoiture", function(ply)
  if not IsValid(ply) then return end
	if ranksAdmins[ply:GetUserGroup()] and enzoFR60.CVoiture.CheckVersionAddon then
		timer.Simple(5, function() if IsValid(ply) then checkVersion(ply) end end)
	end
end)
