include("shared.lua");

include("autorun/sh_configcvoiture.lua")

surface.CreateFont("enzoFR60.CVoiture", {
	font = "impact",
	size = 54,
	weight = 800,
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

function ENT:Initialize()	

end;

function ENT:Draw()
	self:DrawModel();
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local color = Color(191, 191, 191, 255);
	local agrColor = Color(191, 191, 191, 255);
	
	ang:RotateAroundAxis(ang:Up(), 90);
	ang:RotateAroundAxis(ang:Forward(), 90);	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < enzoFR60.CVoiture.DistanceTxt then
		cam.Start3D2D(pos + ang:Up(), Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.15);		
			if enzoFR60.CVoiture.TxtYes == true then
				draw.SimpleTextOutlined(enzoFR60.CVoiture.LanguageLight, "enzoFR60.CVoiture", 0, -100, Color(6, 170, 52, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0, Color(25, 25, 25, 100));		
			end
		cam.End3D2D();
	end;
end;