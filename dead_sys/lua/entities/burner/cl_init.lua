include('shared.lua')

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
surface.CreateFont("fontsmall", {
	font = "Arial",
	size = 30,
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
function ENT:Draw()
 
 	self:DrawModel()
 	 
 	local ang = self:GetAngles()

 	local pos = self:GetPos() + self:GetUp()*26


 	ang:RotateAroundAxis(self:GetAngles():Right(),0)

 	ang:RotateAroundAxis(self:GetAngles():Up(),180)

 	ang:RotateAroundAxis(self:GetAngles():Forward(),325)


 	if self:GetNWInt( 'burner_stage_2D3D') == 1 then 
 	 cam.Start3D2D( pos , ang , 0.1)

 	-- draw.RoundedBox(0, 0, 240 ,200,150, Color(55, 55, 55, 200))

 	--draw.RoundedBox(number cornerRadius,number x,number y,number width,number height,table color)

 	draw.RoundedBox(0,0,40,318,300,Color(50,50,50,255))

 	draw.SimpleText( DS_BURNER_TEXT ,"font",150,80, Color(200,80,80,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	draw.SimpleText( 'Bring a full coffin ' ,"fontsmall",150,120, Color(125,125,125,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	draw.SimpleText('To start the processus',"fontsmall",150,180, Color(0,0,200,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.SimpleText(self:GetNWString("burner_text"),"font",150,250, Color(255,50,50,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	cam.End3D2D()

 end 
if self:GetNWInt( 'burner_stage_2D3D') == 2 then 
 	 cam.Start3D2D( pos , ang , 0.1)

 	-- draw.RoundedBox(0, 0, 240 ,200,150, Color(55, 55, 55, 200))

 	--draw.RoundedBox(number cornerRadius,number x,number y,number width,number height,table color)

 	draw.RoundedBox(0,0,40,318,300,Color(50,50,50,255))

 	draw.SimpleText('Crematorium',"font",150,80, Color(255,50,50,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	draw.SimpleText( 'Time remaing :' ,"font",160,130, Color(125,125,125,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	draw.SimpleText(self:GetNWString('burner_time_left'),"font",150,180, Color(0,0,200,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.SimpleText(self:GetNWString("burner_text"),"font",150,250, Color(50,255,50,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	cam.End3D2D()
 end
 if self:GetNWInt('burner_stage_2D3D') == 3 then 
 	cam.Start3D2D( pos , ang , 0.1)

 	draw.RoundedBox(0,0,40,318,300,Color(50,50,50,255))

 	draw.SimpleText('Crematorium',"font",150,80, Color(255,50,50,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	draw.SimpleText( 'Time remaing :' ,"font",160,130, Color(125,125,125,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	draw.SimpleText(self:GetNWString('burner_time_left') ,"font",150,180, Color(0,0,200,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.SimpleText(self:GetNWString("burner_text"),"font",150,250, Color(50,255,50,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

 	cam.End3D2D()
 end 
end