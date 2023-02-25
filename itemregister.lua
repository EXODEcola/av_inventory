Items = {}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local neccessaryvars = {'item', 'formatname', 'type', 'tradable', 'candelete', 'weight', 'stackable', 'model'}

defineItem = function(datatable, callback)
    local self = {}

    if type(datatable) ~= 'table' then
        Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1 Error at defineItem function. First param is not a table? ^7')
        return
    end

    local validvars = true
    for i=1, #neccessaryvars, 1 do
        local varname = neccessaryvars[i]
        if datatable[varname] == nil then
            validvars = false
        end
    end
    if not validvars then
        Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1 Error at defineItem function. Variables are not set up right? ^7')
        return
    end

    datatable.description = datatable.description or ''

    self.data = datatable
    self.callback = callback or nil

    Items[self.data.item] = self
end

useItem = function(source, item, slot)
    if Items[item] and Items[item].callback then
        Items[item].callback(source, item, slot)
    end
end

exports('defineItem', defineItem)
exports('useItem', useItem)

function getDefinedItem(item)
    if Items[item] and Items[item].data then
        return Items[item].data
    end
    return
end

defineItem({
    item = 'bread', -- image name and etc.
    formatname = 'Pain', -- formatted name
    type = 'food',
    tradable = true, -- player can drop & put items into storages like glovebox. (IF TRUE)
    candelete = false, -- delete item on death?
    weight = 1.25, -- weight / quantity
    stackable = true, -- is this item stackable? example: weapons are not 
    description = 'Un bon bout de pain.', -- item description
    model = 'v_ret_247_swtcorn2', -- item drop model
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    local xPlayer = ESX.GetPlayerFromId(source)
    if success then
        Config.DebugMsg('Removed 1 amount from the (bread)')
        TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
        TriggerClientEvent('esx_basicneeds:onEat', source)
    end
end)

defineItem({
    item = 'water', 
    formatname = 'Bouteille d\'eau', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.6, 
    stackable = true, 
    description = 'Eau', 
    model = 'v_ret_247_swtcorn2', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    local xPlayer = ESX.GetPlayerFromId(source)
    if success then
        Config.DebugMsg('Removed 1 amount from the (water)')
        TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
        TriggerClientEvent('esx_basicneeds:onDrink', source)
    end
end)

defineItem({
    item = 'redbull', 
    formatname = 'RedBull', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.6, 
    stackable = true, 
    description = 'RedBull', 
    model = 'v_ret_247_swtcorn2', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    if success then
        Config.DebugMsg('Removed 1 amount from the (redbull)')
    end
end)

defineItem({
    item = 'cafe', 
    formatname = 'Café', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.4, 
    stackable = true, 
    description = 'Café', 
    model = 'v_ret_247_swtcorn2', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    if success then
        Config.DebugMsg('Removed 1 amount from the (café)')
    end
end)

defineItem({
    item = 'sevenup', 
    formatname = 'Bouteille de 7-Up', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.7, 
    stackable = true, 
    model = 'prop_ld_can_01', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    if success then
        Config.DebugMsg('Removed 1 amount from the (sevenup)')
    end
end)

defineItem({
    item = 'cocacola', 
    formatname = 'Bouteille de Coca-Cola', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.7, 
    stackable = true, 
    model = 'v_ret_247_swtcorn2', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    if success then
        Config.DebugMsg('Removed 1 amount from the (cocacola)')
    end
end)

defineItem({
    item = 'eau_arom', 
    formatname = 'Bouteille de Diabolo', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.7, 
    stackable = true, 
    model = 'v_ret_247_swtcorn2', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    if success then
        Config.DebugMsg('Removed 1 amount from the (eau_arom)')
    end
end)

defineItem({
    item = 'cheeseburger', 
    formatname = 'CheeseBurger', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.8, 
    stackable = true, 
    model = 'v_ret_247_swtcorn2', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    if success then
        Config.DebugMsg('Removed 1 amount from the (cheeseburger)')
    end
end)

defineItem({
    item = 'tacos', 
    formatname = 'Tacos', 
    type = 'food',
    tradable = true, 
    candelete = false, 
    weight = 0.8, 
    stackable = true, 
    model = 'v_ret_247_swtcorn2', 
}, function(source, item, slot)
    local identifier = Config.getIdentifier(source)
    if not AquiverInventories[identifier] then return end
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))

    local success = AquiverInventories[identifier].removeItemAtSlot(slot, 1)
    if success then
        Config.DebugMsg('Removed 1 amount from the (tacos)')
    end
end)

defineItem({
    item = 'weed_pooch',
    formatname = 'Pochon de Weed',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)



defineItem({
    item = 'money',
    formatname = 'Argent',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.1,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'wood',
    formatname = 'Bois',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'pistol_ammo_box',
    formatname = 'Boite Munition Pistolet',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'rifle_ammo_box',
    formatname = 'Boite Munition fusil d\'assaut',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'shotgun_ammo_box',
    formatname = 'Boîte de Cal.12',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'dream_catcher',
    formatname = 'Attrapeur de rêve',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'wedding_ring',
    formatname = 'Anneau de mariage',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'wedding_ring',
    formatname = 'Anneau de mariage',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'ring',
    formatname = 'Anneau',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'copper_coil',
    formatname = 'Bobine de cuivre',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'toolbox',
    formatname = 'Boite à outils',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'sticky_bomb',
    formatname = 'Bombe collante',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'tablet',
    formatname = 'Tablette',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'phone',
    formatname = 'Iphone 14',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'phone2',
    formatname = 'OnePlus',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'phone3',
    formatname = 'Xiamo',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'phone4',
    formatname = 'Pixel 2',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'phone5',
    formatname = 'Samsung S8',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'phone6',
    formatname = 'Samsung',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'redwood_pack',
    formatname = 'Pack de cigarette Redwood',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'condom_xs',
    formatname = 'Préservatif XS',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'tissue_box',
    formatname = 'Boîte de mouchoir',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'contract',
    formatname = 'Contract',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'fixkit',
    formatname = 'Kit de réparation',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'acier',
    formatname = 'Acier',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'pistol50',
    formatname = 'Desert Eagle',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = '9mm_rounds',
    formatname = 'Munition de pistolet',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.1,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'weed',
    formatname = 'Weed',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'weed2',
    formatname = 'Weed',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'weed_cut',
    formatname = 'Weed découpée',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'weed_pure',
    formatname = 'Weed pure',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'weed_sachet',
    formatname = 'Weed en sachet',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'joint',
    formatname = 'Joint',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bandana_blue',
    formatname = 'Bandana Bleu',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bandana_green',
    formatname = 'Bandana Vert',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bandana_purple',
    formatname = 'Bandana Violet',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bandana_red',
    formatname = 'Bandana Rouge',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bandana_yellow',
    formatname = 'Bandana Jaune',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'wrench',
    formatname = 'Clé à molette',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'weed_brick',
    formatname = 'Brique de weed',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'cutters',
    formatname = 'Coupeurs',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coupon5',
    formatname = 'Coupon 5%',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coupon10',
    formatname = 'Coupon 10%',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coupon15',
    formatname = 'Coupon 15%',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coupon20',
    formatname = 'Coupon 20%',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'metal_detector',
    formatname = 'Détecteur de métaux',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'cougar_tooth',
    formatname = 'Dent de cougar',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'diamond_blue',
    formatname = 'Diamant Bleu',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'diamond_yellow',
    formatname = 'Diamant Jaune',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'diamond_disc',
    formatname = 'Disque de diamant',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'platinum_disc',
    formatname = 'Disque de platine',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'gold_disc',
    formatname = 'Disque d\'or',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'disk',
    formatname = 'Disque',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'printed_materials',
    formatname = 'Documents imprimés',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'donut',
    formatname = 'Donut',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'screen',
    formatname = 'Ecran',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'screwdriver_set',
    formatname = 'Ensemble de tournevis',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'sponge',
    formatname = 'Eponge',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'flyer',
    formatname = 'Flyer',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'drill_bit',
    formatname = 'Foret de perçeuse',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'fries',
    formatname = 'Frites',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 1.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'carokit',
    formatname = 'Kit de carrosserie',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'oil',
    formatname = 'Huile',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'salt',
    formatname = 'Sel',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'crack_pile',
    formatname = 'Tas de crack',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'opium_box',
    formatname = 'Tas d\'opium',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'ticket',
    formatname = 'Ticket',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'golden_ticket',
    formatname = 'Ticket d\'or',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'glue',
    formatname = 'Colle',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'paper_ballas',
    formatname = 'Papier Ballas',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'paper_changgang',
    formatname = 'Papier ChangGang',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'paper_gsf',
    formatname = 'Papier GSF',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'paper_leanbois',
    formatname = 'Papier Leanbois',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'paper_lsd',
    formatname = 'Papier de LSD',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'paper_prison',
    formatname = 'Papier Prison',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'paper_vagos',
    formatname = 'Papier Vagos',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'plastic',
    formatname = 'Plastique',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'pebble',
    formatname = 'Caillou',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'rubber',
    formatname = 'Caoutchouc',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'ruby',
    formatname = 'Ruby',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'sacred_hummus',
    formatname = 'Hummus sacré',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'scale_small',
    formatname = 'Petite Balance',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'scrap_tool',
    formatname = 'Outil de feraille',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'secure_briefcase',
    formatname = 'Malette sécurisée',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'sprite',
    formatname = 'Bouteille de Sprite',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'university_certificate',
    formatname = 'Certificat universitaire',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'unknown_metal',
    formatname = 'Métal inconnu',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'usb_key',
    formatname = 'Clé USB',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'no5',
    formatname = 'No5',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'monster',
    formatname = 'Monster',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'mask',
    formatname = 'Masque',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'school_book',
    formatname = 'Livre de cours',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'diamond_chessboard',
    formatname = 'Echiquier de diamant',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'diamond_skull',
    formatname = 'Crâne de diamant',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'doll',
    formatname = 'Poupée',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'simcard',
    formatname = 'Carte Sim',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'aluminum',
    formatname = 'Aluminium',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'restaurant_menu',
    formatname = 'Menu de restaurant',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'connected_watch',
    formatname = 'Montre connectée',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coke',
    formatname = 'Cocaine',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coke_bag',
    formatname = 'Sac de coke',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coke_brick',
    formatname = 'Brique de coke',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coke_brick2',
    formatname = 'Brique de coke',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bank_card',
    formatname = 'Carte bancaire',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'crack_box',
    formatname = 'Carton de Crack',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'meth_box',
    formatname = 'Carton de Meth',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'carbinerifle',
    formatname = 'M4A1',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'battery',
    formatname = 'Batterie',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'appistol',
    formatname = 'Pistolet Perforant',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'assaultrifle',
    formatname = 'AK 47',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable =  false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'assaultshotgun',
    formatname = 'UTAS UTS-15',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'assaultsmg',
    formatname = 'FN P90 (SMG)',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'autoshotgun',
    formatname = 'AA-12',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bat',
    formatname = 'Batte',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bottle',
    formatname = 'Bouteille cassée',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bullpuprifle',
    formatname = 'Type 86-S',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bullpuprifle_mk2',
    formatname = 'Fusil BullPup MK2',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bullpupshotgun',
    formatname = 'FlashBall',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'bzgas',
    formatname = 'Grenade à gaz bz',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'carbinerifle_mk2',
    formatname = 'Carabine MK2',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'ceramicpistol',
    formatname = 'Pistolet Céramique',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'combatmg',
    formatname = 'M249E1',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'combatmg_mk2',
    formatname = 'MG MK2',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'combatpdw',
    formatname = 'SIG Sauer MPX',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'combatpistol',
    formatname = 'Glock',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'circuit',
    formatname = 'Circuit',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'coffee',
    formatname = 'Café',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'gold_token',
    formatname = 'Jeton d\'or',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'diamond',
    formatname = 'Diamant',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'empty_bag',
    formatname = 'Sachet vide',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)

defineItem({
    item = 'Bandage',
    formatname = 'Bandage',
    type = 'item',
    tradable = true,
    candelete = false,
    weight = 0.4,
    stackable = true,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    Config.DebugMsg(string.format('(player:%s) %s used on slot %s', source, item, slot))
end)