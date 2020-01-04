AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')


function ENT:Initialize()

	self:SetModel("models/props_wasteland/laundry_washer003.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self.damage = 200
	self.BurnerTime = 0 
	self.test = true
    local phys = self:GetPhysicsObject()

    if phys:IsValid() then 

        phys:Wake()
    
    end

    self:SetNWString( 'burner_text',"Empty")
    self:SetNWString( 'bruner_time_text','N/A')
    self:SetNWInt('burner_stage_2D3D', 1)
    self:SetNWBool('burner_full',false)
    self:SetNWInt('burner_live', self.damage)
end

function ENT:StartTouch(ent)
 	if ent:GetClass() == "coffin" and ent:GetNWBool( 'coffin_full' ) == true  then 
 		ent:Remove()	
 		self:SetNWString( 'burner_text',"Full")
 		self:SetNWInt('burner_stage_2D3D', 2)
 		self:SetNWBool('burner_full',true)
 		self.BurnerTime = CurTime() + 10
  	end
end
function ENT:OnTakeDamage(dmg)
	self.damage = self.damage - dmg:GetDamage()
	if (self.damage <= 0) then
		self:Remove()

	local effectData = EffectData();	
	effectData:SetStart(self:GetPos());
	effectData:SetOrigin(self:GetPos());
	effectData:SetScale(8);	
	util.Effect("Explosion", effectData, true, true);
	end
end

function ENT:Think()
	if self:GetNWBool('burner_full') == true and  self.BurnerTime <= CurTime() then 
		self:SetColor(Color(150,150,255,255))
		   self:SetNWBool('burner_full',false)
		   self:SetNWInt('burner_stage_2D3D',1)
		   self:SetNWString( 'burner_text',"Empty")
end 
while self.test == true do
	self:SetNWString('burner_time_left',self.BurnerTime)
end
end

