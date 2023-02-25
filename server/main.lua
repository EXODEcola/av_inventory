ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

ESX.RegisterServerCallback("esx_inventoryhud:getPlayerInventory", function(source, cb, target)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if targetXPlayer ~= nil then
		cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout, weight = targetXPlayer.getWeight(), maxWeight = targetXPlayer.maxWeight})
	else
		cb(nil)
	end
end)

ESX.RegisterServerCallback(Shared.prefix.."getalmodifiitems", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = {}
	MySQL.Async.fetchAll('SELECT * FROM user_inventory WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	}, function(result) 
		for i = 1, #result, 1 do  
			table.insert(items, {gdfsg = result[i].Nommodif, item = result[i].item})
		end  
		cb(items) 
	end)  
end)

RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler("esx_inventoryhud:tradePlayerItem",	function(from, target, type, itemName, itemCount)
	local _source = from

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if type == "item_standard" then
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local targetItem = targetXPlayer.getInventoryItem(itemName)

		if itemCount > 0 and sourceItem.count >= itemCount then
			if targetXPlayer.canCarryItem(itemName, itemCount) then

				sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem(itemName, itemCount)
			else
				sourceXPlayer.showNotification('~r~Impossible~s~~n~l\'inventaire de l\'individu est plein.')
			end
		end
	elseif type == "item_money" then
		if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
			sourceXPlayer.removeMoney(itemCount)
			targetXPlayer.addMoney(itemCount)
		end
	elseif type == "item_account" then
		if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
			sourceXPlayer.removeAccountMoney(itemName, itemCount)
			targetXPlayer.addAccountMoney(itemName, itemCount)
		end
	elseif type == "item_weapon" then
		if not targetXPlayer.hasWeapon(itemName) then
			sourceXPlayer.removeWeapon(itemName)
			targetXPlayer.addWeapon(itemName, itemCount)
		end
	end
end)

RegisterCommand("openinventory", function(source, args, rawCommand)
	local target = tonumber(args[1])
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if targetXPlayer ~= nil then
		TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
	end
end)

RegisterNetEvent('blockcontrol')
AddEventHandler('blockcontrol', function(target)

	TriggerClientEvent('esx_inventoryhud:blockcontrol1', target, source)
	TriggerClientEvent('esx_inventoryhud:blockcontrol', target, source)
end)

RegisterNetEvent('debloqueontrol')
AddEventHandler('debloqueontrol', function(target)
	TriggerClientEvent('esx_inventoryhud:debloqueontrol', target, source)
end)

RegisterServerEvent('11_giveIdentity') 
AddEventHandler('11_giveIdentity', function(target, playerIdentity, licenses) 
	  TriggerClientEvent('11_giveIdentityCL', target, playerIdentity, licenses)
end)   

RegisterServerEvent('11_refreshIdentity') 
AddEventHandler('11_refreshIdentity', function() 
    refreshIdentity(source)
end)

RegisterServerEvent('11_refreshLicenses') 
AddEventHandler('11_refreshLicenses', function() 
    refreshLicenses(source)
end)


RegisterServerEvent('11_controlLicense') 
AddEventHandler('11_controlLicense', function(type, bool, target) 
    local currentSource = target or source

    local xPlayer = ESX.GetPlayerFromId(currentSource)

    MySQL.Async.fetchAll('SELECT licenses FROM users WHERE identifier = @identifier', 
    {
        ['@identifier'] = xPlayer.identifier
    }, function(data)
      local data = json.decode(data[1].licenses)
  
      data[type] = bool

      MySQL.Async.execute('UPDATE users SET licenses = @licenses WHERE identifier = @identifier', {
          ['@identifier'] = xPlayer.identifier,
          ['@licenses'] = json.encode(data) 
      }) 
    end)
    Wait(2000)
    refreshLicenses(currentSource)
end)

function refreshIdentity(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', 
    {
      ['@identifier'] = xPlayer.identifier
    }, function(identity)

      TriggerClientEvent('11_refreshIdentityCL', source, identity)
    end)
end


function refreshLicenses(source)
  local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT licenses FROM users WHERE identifier = @identifier', 
    {
      ['@identifier'] = xPlayer.identifier
    }, function(licenses)

      TriggerClientEvent('11_refreshLicensesCL', source, licenses)
    end)
end

