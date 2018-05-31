if SERVER then
	AddCSLuaFile("shared.lua")
end

include("autorun/sh_configcvoiture.lua")

if CLIENT then
	SWEP.PrintName 			= enzoFR60.CVoiture.LanguageArmePhone
	SWEP.Slot				= 4
	SWEP.SlotPos 			= 1
	SWEP.DrawAmmo 			= false
	SWEP.DrawCrosshair 		= false
	SWEP.HoldType = 		"pistol"
end

SWEP.Author 				= "enzoFR60"
SWEP.Instructions 			= ""
SWEP.Category 				= "enzoFR60 Voiture"

SWEP.Spawnable 				= true
SWEP.AdminSpawnable 		= true

SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip 	= 0
SWEP.Primary.Automatic 		= true
SWEP.Primary.Ammo 			= ""

SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= 0
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo 		= ""

SWEP.DrawAmmo				= false
SWEP.DrawWeaponInfoBox		= false

SWEP.BounceWeaponIcon   	= false
SWEP.DrawCrosshair			= false
SWEP.Weight					= 30

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/c_arms_dod.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(-12, -8.334, -18), angle = Angle(110, 90, 0) },
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 10, -15) },
	["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-10, 10, -15) },
	["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 0.8, 0.8), pos = Vector(0, 0, 0), angle = Angle(-10, 0, -15) }
}

function SWEP:Initialize()
	self:SetWeaponHoldType("pistol")
	self:SendWeaponAnim(ACT_VM_HOLSTER);
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
	
end