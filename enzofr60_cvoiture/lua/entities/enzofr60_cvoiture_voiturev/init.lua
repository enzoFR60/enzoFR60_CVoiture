AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

include("autorun/sh_configcvoiture.lua")

function ENT:Initialize()
	self:SetModel("models/props_vehicles/car002b_physics.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)	
	self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self.damage = 700
	self:SetNWInt("cvoiture_phare", 0)
	self:SetNWInt("cvoiture_plaquei", 0)
	self:SetNWInt("cvoiture_porte", 0)
	self:SetNWInt("cvoiture_roue", 0)
	self:SetNWInt("cvoiture_vitre", 0)
	self:SetNWInt("cvoiture_siege", 0)
	
	self:SetNWInt("besoin_cvoiture_phare", 2)
	self:SetNWInt("besoin_cvoiture_porte", 1)
	self:SetNWInt("besoin_cvoiture_roue", 4)
	self:SetNWInt("besoin_cvoiture_vitre", 6)
	self:SetNWInt("besoin_cvoiture_siege", 2)
	self:SetNWInt("besoin_cvoiture_plaquei", 2)
	self:SetNWInt("state", 0)
	self:SetNWInt("width", COX_WIDTH_ST_2)
	self.CanUse = true
	self.jailWall = true
	
	local price = math.random(enzoFR60.CVoiture.PrixMin, enzoFR60.CVoiture.PrixMax);

	self:SetNWInt("price", price);
end

function ENT:SpawnFunction(ply, trace)
	local ent = ents.Create("enzofr60_cvoiture_voiturev");
	ent:SetPos(trace.HitPos + trace.HitNormal * 22);
	ent:Spawn();
	ent:Activate();    
	return ent;
end;

function ENT:Use(activator, caller)
		local curTime = CurTime();
	if (!self.nextUse or curTime >= self.nextUse) then
		if self.CanUse then
		if enzoFR60.CVoiture.Metier[ team.GetName( caller:Team() ) ] then
			if self:GetNWInt("state") == 100 then
			if caller:GetActiveWeapon():GetClass() == "enzofr60_cvoiture_tel" then
			self:SetNWInt('timer', CurTime() + enzoFR60.CVoiture.TempsChangement)
			self:SetNWInt("state", 0)
			self.CanUse = false
			DarkRP.notify( caller, 0, 4, enzoFR60.CVoiture.LanguageCVente )
			timer.Simple(enzoFR60.CVoiture.TempsChangement, function() 
				self.CanUse = true 
				DarkRP.notify( caller, 0, 4, enzoFR60.CVoiture.LanguageFVente..", "..self:GetNWInt('price').."€" )
				caller:addMoney(self:GetNWInt("price"))
				self:Remove()
			end)
			else
				DarkRP.notify( caller, 0, 4, enzoFR60.CVoiture.LanguageErrorPhoneVente )
			end
			else
				DarkRP.notify( caller, 0, 4, enzoFR60.CVoiture.LanguageNFVente )
			end
			else
			DarkRP.notify( caller, 0, 4, enzoFR60.CVoiture.LanguageErrorJobVente )
			end
			else
			DarkRP.notify( caller, 0, 4, enzoFR60.CVoiture.LanguageNopVente )
		end
	end
end


function ENT:OnTakeDamage(dmg)
	self.damage = self.damage - dmg:GetDamage()
	if (self.damage <= 0) then
		self:Remove()
	end
end

function ENT:StartTouch(hitEnt)
	if not IsValid(hitEnt) then return end
	
	if self.CanUse then
		if (hitEnt:GetClass() == "enzofr60_cvoiture_plaquei") then
			if (hitEnt:GetNWInt("cvoiture_plaquei") > 0) && (self:GetNWInt("cvoiture_plaquei") < self:GetNWInt("besoin_cvoiture_plaquei")) then
				hitEnt:SetNWInt("cvoiture_plaquei", hitEnt:GetNWInt("cvoiture_plaquei")-1)
				hitEnt:Remove();
				self:SetNWInt("cvoiture_plaquei", 1+self:GetNWInt("cvoiture_plaquei"))
				self:SetNWInt("state", self:GetNWInt("state") + 5)
				if self:GetNWInt("cvoiture_plaquei") == 1 then
					local plaquei	= ents.Create("enzofr60_cvoiture_plaquei")
					plaquei:SetPos(self:LocalToWorld(Vector(67, -2.5, -5.2)))
					plaquei:SetAngles(self:LocalToWorldAngles(Angle(1.30, -92, 0)))
					plaquei:SetParent(self)
					plaquei:Spawn()
				elseif self:GetNWInt("cvoiture_plaquei") == 2 then
					local plaquei2	= ents.Create("enzofr60_cvoiture_plaquei")
					plaquei2:SetPos(self:LocalToWorld(Vector(-82, 0, -8)))
					plaquei2:SetAngles(self:LocalToWorldAngles(Angle(-4, 90, -5)))
					plaquei2:SetParent(self)
					plaquei2:Spawn()
				end
			end;
		end
		
		if (hitEnt:GetClass() == "enzofr60_cvoiture_porte") then
			if (hitEnt:GetNWInt("cvoiture_porte") > 0) && (self:GetNWInt("cvoiture_porte") < self:GetNWInt("besoin_cvoiture_porte")) then
				hitEnt:SetNWInt("cvoiture_porte", hitEnt:GetNWInt("cvoiture_porte")-1)
				hitEnt:Remove();
				self:SetNWInt("cvoiture_porte", 1+self:GetNWInt("cvoiture_porte"))
				self:SetNWInt("state", self:GetNWInt("state") + 20)
				if self:GetNWInt("cvoiture_porte") == 1 then
					local porte	= ents.Create("enzofr60_cvoiture_porte")
					porte:SetPos(self:LocalToWorld(Vector(5, -40.5, 4.5)))
					porte:SetAngles(self:LocalToWorldAngles(Angle(0, 20, 0)))
					porte:SetParent(self)
					porte:Spawn()	
				end
			end;
		end
		
		if (hitEnt:GetClass() == "enzofr60_cvoiture_phare") then
			if (hitEnt:GetNWInt("cvoiture_phare") > 0) && (self:GetNWInt("cvoiture_phare") < self:GetNWInt("besoin_cvoiture_phare")) then
				hitEnt:SetNWInt("cvoiture_phare", hitEnt:GetNWInt("cvoiture_phare")-1)
				hitEnt:Remove();
				self:SetNWInt("cvoiture_phare", 1+self:GetNWInt("cvoiture_phare"))
				self:SetNWInt("state", self:GetNWInt("state") + 5)
				if self:GetNWInt("cvoiture_phare") == 1 then
					local phare	= ents.Create("enzofr60_cvoiture_phare")
					phare:SetPos(self:LocalToWorld(Vector(62, -32.3, 1.2)))
					phare:SetAngles(self:LocalToWorldAngles(Angle(-90, 0, 0)))
					phare:SetParent(self)
					phare:Spawn()
				elseif self:GetNWInt("cvoiture_phare") == 2 then
					local phare2	= ents.Create("enzofr60_cvoiture_phare")
					phare2:SetPos(self:LocalToWorld(Vector(62, 25, 3.2)))
					phare2:SetAngles(self:LocalToWorldAngles(Angle(-90, 0, 0)))
					phare2:SetParent(self)
					phare2:Spawn()
				end
			end;
		end
		
		if (hitEnt:GetClass() == "enzofr60_cvoiture_siege") then
			if (hitEnt:GetNWInt("cvoiture_siege") > 0) && (self:GetNWInt("cvoiture_siege") < self:GetNWInt("besoin_cvoiture_siege")) then
				hitEnt:SetNWInt("cvoiture_siege", hitEnt:GetNWInt("cvoiture_siege")-1)
				hitEnt:Remove();
				self:SetNWInt("cvoiture_siege", 1+self:GetNWInt("cvoiture_siege"))
				self:SetNWInt("state", self:GetNWInt("state") + 5)
				if self:GetNWInt("cvoiture_siege") == 1 then
					local siege	= ents.Create("enzofr60_cvoiture_siege")
					siege:SetPos(self:LocalToWorld(Vector(-2, -15, -2)))
					siege:SetAngles(self:LocalToWorldAngles(Angle(0, -90, 0)))
					siege:SetParent(self)
					siege:Spawn()
				elseif self:GetNWInt("cvoiture_siege") == 2 then
					local siege2	= ents.Create("enzofr60_cvoiture_siege")
					siege2:SetPos(self:LocalToWorld(Vector(-3, 10.5, -2)))
					siege2:SetAngles(self:LocalToWorldAngles(Angle(0, -90, 0)))
					siege2:SetParent(self)
					siege2:Spawn()
				end
			end;
		end
		
		if (hitEnt:GetClass() == "enzofr60_cvoiture_roue") then
			if (hitEnt:GetNWInt("cvoiture_roue") > 0) && (self:GetNWInt("cvoiture_roue") < self:GetNWInt("besoin_cvoiture_roue")) then
				hitEnt:SetNWInt("cvoiture_roue", hitEnt:GetNWInt("cvoiture_roue")-1)
				hitEnt:Remove();
				self:SetNWInt("cvoiture_roue", 1+self:GetNWInt("cvoiture_roue"))
				self:SetNWInt("state", self:GetNWInt("state") + 5)
				if self:GetNWInt("cvoiture_roue") == 1 then
					local roue	= ents.Create("enzofr60_cvoiture_roue")
					roue:SetPos(self:LocalToWorld(Vector(46, 28.5, -13)))
					roue:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
					roue:SetParent(self)
					roue:Spawn()
				elseif self:GetNWInt("cvoiture_roue") == 2 then
					local roue2	= ents.Create("enzofr60_cvoiture_roue")
					roue2:SetPos(self:LocalToWorld(Vector(-45, 28.5, -14)))
					roue2:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
					roue2:SetParent(self)
					roue2:Spawn()
				elseif self:GetNWInt("cvoiture_roue") == 3 then
					local roue3	= ents.Create("enzofr60_cvoiture_roue")
					roue3:SetPos(self:LocalToWorld(Vector(-46, -35.5, -17)))
					roue3:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
					roue3:SetParent(self)
					roue3:Spawn()
				elseif self:GetNWInt("cvoiture_roue") == 4 then
					local roue4	= ents.Create("enzofr60_cvoiture_roue")
					roue4:SetPos(self:LocalToWorld(Vector(46, -35.5, -17)))
					roue4:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
					roue4:SetParent(self)
					roue4:Spawn()
				end
			end;
		end
		
		if (hitEnt:GetClass() == "enzofr60_cvoiture_vitre") then
			if (hitEnt:GetNWInt("cvoiture_vitre") > 0) && (self:GetNWInt("cvoiture_vitre") < self:GetNWInt("besoin_cvoiture_vitre")) then
				hitEnt:SetNWInt("cvoiture_vitre", hitEnt:GetNWInt("cvoiture_vitre")-1)
				hitEnt:Remove();
				self:SetNWInt("cvoiture_vitre", 1+self:GetNWInt("cvoiture_vitre"))
				self:SetNWInt("state", self:GetNWInt("state") + 5)
			end;
		end
	end
end

function ENT:OnTakeDamage(dmg)
	self.damage = self.damage - dmg:GetDamage()
	if (self.damage <= 10) then
		self:Remove()
	end
end

function ENT:OnRemove()
	if not IsValid(self) then return end
end
