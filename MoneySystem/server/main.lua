ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


Citizen.CreateThread(function()
	while true do
		local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			
				if GetPlayerName(xPlayer.source) == 'Lavan' then 
					print('Wilkommen Lavan')
				else
					if xPlayer.getMoney() >= Config.MoneyCount then
						PerformHttpRequest('DISCORD_WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = 'MoneySystem', content = ':warning: ' .. GetPlayerName(xPlayer.source) .. ' hat ' .. xPlayer.getMoney() .. '$ (Money)', avatar_url = 'https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg'}), { ['Content-Type'] = 'application/json' })
					end
					if xPlayer.getAccount('bank').money >= Config.MoneyCount then
						PerformHttpRequest('DISCORD_WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = 'MoneySystem', content = ':warning: ' .. GetPlayerName(xPlayer.source) .. ' hat ' .. xPlayer.getAccount('bank').money .. '$ (Bank)', avatar_url = 'https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg'}), { ['Content-Type'] = 'application/json' })
					end
					if xPlayer.getAccount('black_money').money >= Config.MoneyCount then
						PerformHttpRequest('DISCORD_WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = 'MoneySystem', content = ':warning: ' .. GetPlayerName(xPlayer.source) .. ' hat ' .. xPlayer.getAccount('black_money').money .. '$ (DirtyMoney)', avatar_url = 'https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg'}), { ['Content-Type'] = 'application/json' })
					end
				end
			end	
				

		Citizen.Wait(Config.Interval)
	end
end)
