AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')



function ENT:Initialize()
self:SetNWInt( 'coffin_health' , 100)
	self:SetModel("models/props_junk/wood_crate002a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
    self.damage = self:GetNWInt('coffin_health')
    local phys = self:GetPhysicsObject()

    if phys:IsValid() then 

        phys:Wake()
    
    end
    self:SetNWString('coffin_full_text',"Empty")
    self:SetNWBool('coffin_full',false)
    self:SetNWInt( 'coffin_health' , 100)
end

--self:SetNWInt("coffin_health" ,100)

function ENT:OnTakeDamage(dmg)
    self.damage = self.damage - dmg:GetDamage()
    if (self.damage <= 0) then
        self:Remove()
    end
end

function ENT:StartTouch(ent)
 	if ent:GetClass() == "prop_ragdoll" and ent:GetNWBool( 'dead_player_ragdoll' ) == true and self:GetNWBool('coffin_full' ) == false  then 
 		ent:Remove()
 		self:SetNWBool('coffin_full', true)	
 		self:SetNWString('coffin_full_text',"Full")
  	end
end

function ENT:Think()
    if self:GetNWBool( 'coffin_full' ) == true then 
        PrintMessage(HUD_PRINTCENTER,"Take the coffin to the Creamatorium ! ")
end
end
