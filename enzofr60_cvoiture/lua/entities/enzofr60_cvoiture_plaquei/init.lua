AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");
function ENT:Initialize()
	self:SetModel("models/enzofr60/cvoiture/enzofr60_cvoiture_plaquei.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self:GetPhysicsObject():SetMass(105);
	
	self:SetNWInt("cvoiture_plaquei", 1)
end;

function ENT:OnTakeDamage(dmginfo)
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav");
	self:Remove()
end;
