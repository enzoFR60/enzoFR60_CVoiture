AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");

function ENT:Initialize()
	self:SetModel("models/props_phx/carseat2.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale( self:GetModelScale() * 0.75, 0 )
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self:GetPhysicsObject():SetMass(105);
	
	self:SetNWInt("cvoiture_siege", 1)
end;

function ENT:OnTakeDamage(dmginfo)
	self:VisualEffect();
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav");
	self:Remove()
end;

function ENT:VisualEffect()
	local effectData = EffectData();	
	effectData:SetStart(self:GetPos());
	effectData:SetOrigin(self:GetPos());
	effectData:SetScale(8);	
	util.Effect("GlassImpact", effectData, true, true);
end;

