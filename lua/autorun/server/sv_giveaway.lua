timer.Remove("HostName")
timer.Create( "HostName",GiveawayConfig.RefreshTime, 0, function()
  local count = GetGlobalInt("RealPlayerNumber",0)
  local palierIndex = 1

  for k,v in ipairs(GiveawayConfig.Rewards) do
    if count >= v.players then
      palierIndex = k
    end
  end
   
  local needToHave = 0
  SetGlobalInt("CurrentIndex",palierIndex)
  if GiveawayConfig.Rewards[palierIndex+1] then
    needToHave = GiveawayConfig.Rewards[palierIndex+1].players
  else
    needToHave = GiveawayConfig.Rewards[palierIndex].players
  end
  SetGlobalInt("GiveWayLeft",timer.TimeLeft("GiveWay"))
end)



gameevent.Listen( "player_connect" )
hook.Add("player_connect", "AddGiveway", function(data)
   SetGlobalInt("RealPlayerNumber",GetGlobalInt("RealPlayerNumber",0)+1)
end)

gameevent.Listen( "player_disconnect" )
hook.Add("player_disconnect", "RemoveGiveWay", function(data)
  SetGlobalInt("RealPlayerNumber",GetGlobalInt("RealPlayerNumber",0)-1)
end)



timer.Remove("Giveway")
timer.Create( "GiveWay",GiveawayConfig.GiveTime*60, 0, function()

  local count = GetGlobalInt("RealPlayerNumber",0)
  local give = true
  local howMany = GiveawayConfig.Rewards[GetGlobalInt("CurrentIndex",1)].starsAmount

    if(howMany > 0) then
      local players = player.GetAll()
      cpt = #players
      local rand = players[math.random( 1, #players )]
      if rand then
        PrintMessage(HUD_PRINTTALK , rand:Nick() .. " a gagné " .. howMany .. "€ !")
      rand:addMoney(howMany)
      SetGlobalString("LastWinner", rand:Nick())
      end

    end

end )