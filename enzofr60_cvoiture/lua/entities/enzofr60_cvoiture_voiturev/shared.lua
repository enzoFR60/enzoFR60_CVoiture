include("autorun/sh_configcvoiture.lua")
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = enzoFR60.CVoiture.LanguageVR
ENT.Category 		= "enzoFR60 Voiture"
ENT.Author			= "enzoFR60"
ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupDataTables()
	self:NetworkVar("Int",0,"price")
	self:NetworkVar("Entity",1,"owning_ent")
end