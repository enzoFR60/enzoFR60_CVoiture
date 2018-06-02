AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
include("shared.lua");
function ENT:Initialize()
	self:SetModel("models/enzofr60/cvoiture/enzofr60_cvoiture_plaquei.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
  
	local phys = self:GetPhysicsObject()
  
  if IsValid(phys) then
    phys:Wake()
   	phys:SetMass(105)
  end
	
	self:SetNWInt("cvoiture_plaquei", 1)
end;
