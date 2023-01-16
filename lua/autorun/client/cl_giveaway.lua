surface.CreateFont( "giveaway_darkrpfr_joueur", {
	font = "Montserrat ExtraBold",
	extended = false,
	size = 24,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )
surface.CreateFont( "giveaway_darkrpfr_joueur2", {
	font = "Montserrat Medium",
	extended = false,
	size = 20,
	weight = 700,
	blursize = 0,
	scanlines = 0,
	antialias = true,
} )
hook.Add( "HUDPaint", "HUDPaint_DrawABox", function()
	local realPlayers = GetGlobalInt("RealPlayerNumber",0)
	local nextTime = GetGlobalInt("GiveWayLeft",0)
	local timeText = ""
	if nextTime <= 60 then
		timeText = math.floor(nextTime) .. "s"
	else
		timeText = math.floor(nextTime/60) .. "m"
	end
	local palierIndex = GetGlobalInt("CurrentIndex",1)

	draw.RoundedBox(6, ScrW()-180, 40, 152, 34,  Color(35, 35, 40,230),false,true, false, true)
	draw.RoundedBox(6, ScrW()-180, 80, 152, 34,  Color(35, 35, 40,230),false,true, false, true)
	//draw.RoundedBox( 10, ScrW()-1, 40, 16, 160, Color(0, 0, 0, 190) )
	//draw.SimpleText( "DarkRP.fr GiveAway", "rhc_darkrp_prix",80, 30+110, Color(255,255, 255,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
    //draw.SimpleText( "Dernier gagnant : " .. GetGlobalString("LastWinner", "Aucun"), "rhc_darkrp_prix",40, 65+110, Color(255,255, 255,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
    if palier == 0 then
    	palier = "Aucun"
    end
    local nextPalier = "Aucun"
    local requireNext = realPlayers  .. "/" .. GiveawayConfig.Rewards[palierIndex].players
    if GiveawayConfig.Rewards[palierIndex+1] then
    	nextPalier =  GiveawayConfig.Rewards[palierIndex+1].starsAmount
    	requireNext = realPlayers  .. "/" .. GiveawayConfig.Rewards[palierIndex+1].players
    end
    //draw.SimpleText( "Prochain palier : " .. nextPalier, "rhc_darkrp_prix",40, 125+110, Color(255,255, 255,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
    draw.SimpleText( requireNext, "giveaway_darkrpfr_joueur",ScrW()-172, 44, Color(255,255, 255,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	//draw.SimpleText( "|", "giveaway_darkrpfr_joueur",ScrW()-127, 43, Color(147, 13, 13,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	draw.RoundedBox(2, ScrW()-127, 44, 4, 26,  Color(147, 13, 13,255),false,true, false, true)
	draw.SimpleText( "GiveAway", "giveaway_darkrpfr_joueur2",ScrW()-114, 46, Color(255,255, 255,220),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

	draw.SimpleText( timeText, "giveaway_darkrpfr_joueur",ScrW()-172, 84, Color(255,255, 255,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	//draw.SimpleText( "|", "giveaway_darkrpfr_joueur",ScrW()-127, 82, Color(147, 13, 13,255),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
	draw.RoundedBox(2, ScrW()-127, 84, 4, 26,  Color(147, 13, 13,255),false,true, false, true)
	draw.SimpleText( "Tirage", "giveaway_darkrpfr_joueur2",ScrW()-86, 86, Color(255,255, 255,220),TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )

end )