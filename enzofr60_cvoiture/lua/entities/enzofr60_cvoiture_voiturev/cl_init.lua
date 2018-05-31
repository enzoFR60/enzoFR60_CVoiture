include("shared.lua")

include("autorun/sh_configcvoiture.lua")

surface.CreateFont("enzoFR60.CVoiture3", {
	font = "Arial",
	size = 30,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});

function ENT:Draw()
	self:DrawModel();
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local color = Color(191, 191, 191, 255);
	local agrColor = Color(191, 191, 191, 255);
	
	local TIMER;
	local width = self:GetNWInt("width");
	if (self:GetNWInt('timer') < CurTime()) then
		TIMER = 0
	else 
		TIMER = self:GetNWInt('timer')-CurTime()
	end
	
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < enzoFR60.CVoiture.DistanceTxt + 50 then
		cam.Start3D2D(pos + ang:Up(), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.15);		
			draw.SimpleTextOutlined(enzoFR60.CVoiture.LanguageVR, "enzoFR60.CVoiture2", 5, -380, Color(6, 170, 52, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0, Color(0,0,0));		
			
			if self:GetNWInt('timer') > 0 then
				draw.SimpleTextOutlined( enzoFR60.CVoiture.LanguageTime..": "..string.ToMinutesSeconds(TIMER), "enzoFR60.CVoiture3", -80, -350, Color(255,255,255,255), 0, 0, 1, Color(0,0,0) )
				draw.SimpleTextOutlined( self:GetNWInt('price')..enzoFR60.CVoiture.LanguageSign, "enzoFR60.CVoiture3", -70, -290, Color(255,255,255,255), 0, 0, 1, Color(0,0,0) )
			end
			
			draw.SimpleTextOutlined( enzoFR60.CVoiture.LanguageEtat..":"..self:GetNWInt("state").."%", "enzoFR60.CVoiture3", -70, -320, Color(6, 170, 52,118), 0, 0, 1, Color(0,0,0) )
		cam.End3D2D();
	end;
end;