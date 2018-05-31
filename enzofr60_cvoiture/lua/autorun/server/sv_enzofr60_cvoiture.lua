include("autorun/sh_configcvoiture.lua")

local function CheckVersionCVoiture( ply )
	for k, v in pairs(player.GetAll()) do
	if v:GetUserGroup() == "superadmin" and enzoFR60.CVoiture.CheckVersionAddon then
	timer.Create("InitialTimerVersionCheckCVoiture", 10, 1, function()
		versionCVoiture()
	end)
	end
	end
end
hook.Add( "PlayerInitialSpawn", "InitialVersionCheckCVoiture", CheckVersionCVoiture )

VersionFrCVoiture = 1.0 -- Don't Touch ! Pas Touche !

local versionCheck = 0
function versionCVoiture()
    versionCheck = versionCheck+1;
    local newVersion = nil
	for k, v in pairs(player.GetAll()) do
	if v:GetUserGroup() == "superadmin" and enzoFR60.CVoiture.CheckVersionAddon then
    http.Fetch("https://raw.githubusercontent.com/enzoFR60/enzoFR60_CVoiture/master/version.txt",
        function(body, len, headers, code)

            newVersion = tonumber(body)

            if newVersion > VersionFrCVoiture then
                DarkRP.notify( v, 0, 20, "[CVoiture] "..enzoFR60.CVoiture.LanguageCheckVersionNonValide )
			else
				DarkRP.notify( v, 0, 20, "[CVoiture] "..enzoFR60.CVoiture.LanguageCheckVersionValide )
		   end

        end,
        function(error)

            if versionCheck != 1 then
				DarkRP.notify( v, 0, 20, "[CVoiture] "..enzoFR60.CVoiture.LanguageCheckVersionError )
			end

            timer.Create("CVoitureReCheck", 40, 1, function()
                CheckVersionCVoiture()
            end)

        end
		
    )
	end
	end

end