include('shared.lua')

surface.CreateFont("fonttitle", {
	font = "Arial Black",
	size = 75,
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = true,
	bold = true,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
});

surface.CreateFont("font", {
	font = "Arial",
	size = 50,
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


--local test = self:GetNWBool("coffin_full")

function ENT:Draw()
 
 	self:DrawModel()
 	
 	 local ang = self:GetAngles()
 	 local pos = self:GetPos()


 		ang:RotateAroundAxis(self:GetAngles():Forward(),90)
 		ang:RotateAroundAxis(self:GetAngles():Up(),90)

 	cam.Start3D2D(pos+self:GetForward()*20+self:GetUp()*7.5, ang, 0.15)
 			surface.SetDrawColor(Color(55, 55, 55, 200));
			surface.DrawRect(-200, -55, 402, 210);
			draw.SimpleText("Coffin","fonttitle",0,-30, Color(50,50,125,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Stats : ","font",0,30, Color(20,125,20,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText(self:GetNWString("coffin_full_text"),"font",0,65, Color(125,75,75,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText(self:GetNWString( 'dead_player_name_ragdoll' ),"font",0,50, Color(125,75,75,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()

end