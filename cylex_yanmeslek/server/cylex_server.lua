ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingMelon   = {}
local PlayersTransformingMelon = {}
local PlayersSellingMelon      = {}
local PlayersHarvestingSarap   = {}
local PlayersTransformingSarap = {}
local PlayersSellingSarap      = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	-- SetTimeout(120 * 1000, CountCops)
end

-- CountCops()

-------------------------------------------------------
-----------------------Sarap----------------------------
-------------------------------------------------------
local function HarvestSarap(source)

	--if CopsConnected < Config.RequiredCopsSarap then
		--TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsSarap))
		--return
	--end
	
	SetTimeout(Config.TimeToFarmSarap, function()

		if PlayersHarvestingSarap[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local sarap = xPlayer.getInventoryItem('sarap')

			if sarap.limit ~= -1 and sarap.count >= sarap.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_sarap'))
			else
				xPlayer.addInventoryItem('sarap', 1)
				HarvestSarap(source)
			end

		end
	end)
end

RegisterServerEvent('cylex:startHarvestSarap')
AddEventHandler('cylex:startHarvestSarap', function()

	local _source = source

	PlayersHarvestingSarap[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestSarap(_source)

end)

RegisterServerEvent('cylex:stopHarvestSarap')
AddEventHandler('cylex:stopHarvestSarap', function()

	local _source = source

	PlayersHarvestingSarap[_source] = false

end)

local function TransformSarap(source)

	--if CopsConnected < Config.RequiredCopsSarap then
		--TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsSarap))
		--return
	--end

	SetTimeout(Config.TimeToProcessSarap, function()

		if PlayersTransformingSarap[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			
			local SarapQuantity = xPlayer.getInventoryItem('sarap').count
			local poochQuantity = xPlayer.getInventoryItem('choped_sarap').count

			if poochQuantity > 25 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif SarapQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_sarap'))
			else
				xPlayer.removeInventoryItem('sarap', 5)
				xPlayer.addInventoryItem('choped_sarap', 1)
				
				TransformSarap(source)
			end

		end
	end)
end

RegisterServerEvent('cylex:startTransformSarap')
AddEventHandler('cylex:startTransformSarap', function()

	local _source = source

	PlayersTransformingSarap[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformSarap(_source)

end)

RegisterServerEvent('cylex:stopTransformSarap')
AddEventHandler('cylex:stopTransformSarap', function()

	local _source = source

	PlayersTransformingSarap[_source] = false

end)

local function SellSarap(source)

	SetTimeout(Config.TimeToSellSarap, function()

		if PlayersSellingSarap[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('choped_sarap').count

			if poochQuantity == 0 then
			  --TriggerClientEvent('esx:showNotification', source, _U('no_pouches_Sarap_sale'))
			    TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Satıcak uyuşturucu paketi kalmadı.'})
		      --exports['rootNotify']:showNotification('info', 'Satıcak uyuşturucu paketi kalmadı..', 'Uyarı', 2500)
			else
				xPlayer.removeInventoryItem('choped_sarap', 1)
				xPlayer.addAccountMoney('black_money', 50)
				
				SellSarap(source)
			end

		end
	end)
end

RegisterServerEvent('cylex:startSellSarap')
AddEventHandler('cylex:startSellSarap', function()

	local _source = source

	PlayersSellingSarap[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellSarap(_source)

end)

RegisterServerEvent('cylex:stopSellSarap')
AddEventHandler('cylex:stopSellSarap', function()

	local _source = source

	PlayersSellingSarap[_source] = false

end)

------------- KARPUZ -------------------
local function HarvestMelon(source)

	if PlayersHarvestingMelon[source] == true then
	
	SetTimeout(Config.TimeToFarmMelon, function()

		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
			
		local melon = xPlayer.getInventoryItem('melon')

		if melon.limit ~= -1 and melon.count >= melon.limit then
			TriggerClientEvent('esx:showNotification', source, _U('inv_full_melon'))
		else
			xPlayer.addInventoryItem('melon', 1)
			HarvestMelon(source)
		end
	end)
	end
end

RegisterServerEvent('cylex:startHarvestMelon')
AddEventHandler('cylex:startHarvestMelon', function()

	local _source = source

	PlayersHarvestingMelon[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMelon(_source)

end)

RegisterServerEvent('cylex:stopHarvestMelon')
AddEventHandler('cylex:stopHarvestMelon', function()

	local _source = source

	PlayersHarvestingMelon[_source] = false

end)

local function TransformMelon(source)
	
	SetTimeout(Config.TimeToProcessMelon, function()

		if PlayersTransformingMelon[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			local melonQuantity = xPlayer.getInventoryItem('melon').count
			local poochQuantity = xPlayer.getInventoryItem('choped_melon').count

			if poochQuantity > 25 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif melonQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_melon'))
			else
				xPlayer.removeInventoryItem('melon', 5)
				xPlayer.addInventoryItem('choped_melon', 1)
			
				TransformMelon(source)
			end

		end
	end)
end

RegisterServerEvent('cylex:startTransformMelon')
AddEventHandler('cylex:startTransformMelon', function()

	local _source = source

	PlayersTransformingMelon[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMelon(_source)

end)

RegisterServerEvent('cylex:stopTransformMelon')
AddEventHandler('cylex:stopTransformMelon', function()

	local _source = source

	PlayersTransformingMelon[_source] = false

end)

local function SellMelon(source)

	--if CopsConnected < Config.RequiredCopsMelon then
		--TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMelon))
		--return
	--end
	
	SetTimeout(Config.TimeToSellMelon, function()

		if PlayersSellingMelon[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('choped_melon').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_melon_sale'))
			else
				xPlayer.removeInventoryItem('choped_melon', 1)
				xPlayer.addMoney(20)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one_melon'))
				SellMelon(source)
			end

		end
	end)
end

RegisterServerEvent('cylex:startSellMelon')
AddEventHandler('cylex:startSellMelon', function()

	local _source = source

	PlayersSellingMelon[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMelon(_source)

end)

RegisterServerEvent('cylex:stopSellMelon')
AddEventHandler('cylex:stopSellMelon', function()

	local _source = source

	PlayersSellingMelon[_source] = false

end)

RegisterServerEvent('cylex:GetUserInventory')
AddEventHandler('cylex:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
	TriggerClientEvent('cylex:ReturnInventory', _source, xPlayer.getInventoryItem('melon').count, xPlayer.getInventoryItem('choped_melon').count, xPlayer.getInventoryItem('sarap').count, xPlayer.getInventoryItem('choped_sarap').count,xPlayer.job.name, currentZone)
end)

ESX.RegisterUsableItem('sarap', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('sarap', 1)

	TriggerClientEvent('cylex:onPot', _source)
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = _U('used_one_sarap')})
end)
