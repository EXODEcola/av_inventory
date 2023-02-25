
-- REGISTER AMMO TYPES
defineItem({
    item = 'pistol_ammo',
    formatname = 'Munition 45 ACP',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.25,
    stackable = true,
    -- description = '',
    model = 'prop_box_ammo01a'
})
defineItem({
    item = 'shotgun_ammo',
    formatname = 'Munition de pompe',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.25,
    stackable = true,
    -- description = '',
    model = 'prop_box_ammo01a'
})

defineItem({
    item = 'rifle_ammo',
    formatname = 'Munition 7.62',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.25,
    stackable = true,
    -- description = '',
    model = 'prop_box_ammo01a'
})

defineItem({
    item = 'pistol_ammo_box',
    formatname = 'Boite Munition Pistolet',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.25,
    stackable = true,
    -- description = '',
    model = 'prop_box_ammo01a'
})
defineItem({
    item = 'shotgun_ammo_box',
    formatname = 'Boîte de Cal.12',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.25,
    stackable = true,
    -- description = '',
    model = 'prop_box_ammo01a'
})

defineItem({
    item = 'rifle_ammo_box',
    formatname = 'Boite Munition fusil d\'assaut',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.25,
    stackable = true,
    -- description = '',
    model = 'prop_box_ammo01a'
})
-- REGISTER WEAPONS
defineItem({
    item = 'WEAPON_PISTOL',
    formatname = 'Pistol',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    description = 'Pistol description.',
    model = 'w_pi_pistol'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_PISTOL')
end)

defineItem({
    item = 'WEAPON_CARBINERIFLE',
    formatname = 'M4A1',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_CARBINERIFLE')
end)

defineItem({
    item = 'WEAPON_APPISTOL',
    formatname = 'Pistolet Perforant',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_APPISTOL')
end)

defineItem({
    item = 'WEAPON_ASSAULTRIFLE',
    formatname = 'AK 47',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_ASSAULTRIFLE')
end)

defineItem({
    item = 'WEAPON_ASSAULTRIFLE_MK2',
    formatname = 'Fusil d\'assaut MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_ASSAULTRIFLE_MK2')
end)

defineItem({
    item = 'WEAPON_ASSAULTSHOTGUN',
    formatname = 'UTAS UTS-15',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_ASSAULTSHOTGUN')
end)

defineItem({
    item = 'WEAPON_ASSAULTSMG',
    formatname = 'FN P90 (SMG)',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_ASSAULTSMG')
end)

defineItem({
    item = 'WEAPON_AUTOSHOTGUN',
    formatname = 'AA-12',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_AUTOSHOTGUN')
end)

defineItem({
    item = 'WEAPON_BAT',
    formatname = 'Batte',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BAT')
end)

defineItem({
    item = 'WEAPON_BOTTLE',
    formatname = 'Bouteille cassée',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BOTTLE')
end)

defineItem({
    item = 'WEAPON_BULLPUPRIFLE',
    formatname = 'Type 86-S',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BULLPUPRIFLE')
end)

defineItem({
    item = 'WEAPON_BULLPUPRIFLE_MK2',
    formatname = 'Fusil BullPup MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BULLPUPRIFLE_MK2')
end)

defineItem({
    item = 'WEAPON_BULLPUPSHOTGUN',
    formatname = 'FlashBall',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BULLPUPSHOTGUN')
end)

defineItem({
    item = 'WEAPON_BZGAS',
    formatname = 'Grenade à gaz bz',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.5,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BZGAS')
end)

defineItem({
    item = 'WEAPON_GRENADE',
    formatname = 'Grenade',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.8,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_GRENADE')
end)

defineItem({
    item = 'WEAPON_MOLOTOV',
    formatname = 'Cocktail Molotov',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.6,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MOLOTOV')
end)

defineItem({
    item = 'WEAPON_STICKYBOMB',
    formatname = 'Bombe collante',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.5,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_STICKYBOMB')
end)

defineItem({
    item = 'WEAPON_PROXMINE',
    formatname = 'Mine de proximité',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_PROXMINE')
end)

defineItem({
    item = 'WEAPON_SNOWBALL',
    formatname = 'Boule de neige',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SNOWBALL')
end)

defineItem({
    item = 'WEAPON_PIPEBOMB',
    formatname = 'Bombe Tuyau',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_PIPEBOMB')
end)

defineItem({
    item = 'WEAPON_BALL',
    formatname = 'Balle',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BALL')
end)

defineItem({
    item = 'WEAPON_SMOKEGRENADE',
    formatname = 'Grenade Fumigène',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.3,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SMOKEGRENADE')
end)

defineItem({
    item = 'WEAPON_CARBINERIFLE_MK2',
    formatname = 'Carabine MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_CARBINERIFLE_MK2')
end)

defineItem({
    item = 'WEAPON_CERAMICPISTOL',
    formatname = 'Pistolet Céramique',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_CERAMICPISTOL')
end)

defineItem({
    item = 'WEAPON_COMBATMG',
    formatname = 'M249E1',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_COMBATMG')
end)

defineItem({
    item = 'WEAPON_COMBATMG_MK2',
    formatname = 'MG MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_COMBATMG_MK2')
end)

defineItem({
    item = 'WEAPON_COMBATPDW',
    formatname = 'SIG Sauer MPX',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_COMBATPDW')
end)

defineItem({
    item = 'WEAPON_COMBATPISTOL',
    formatname = 'Glock',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    model = 'v_ret_247_swtcorn2'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_COMBATPISTOL')
end)

defineItem({
    item = 'WEAPON_PISTOL50',
    formatname = 'Pistol 50',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    description = 'Pistol 50 description.',
    model = 'w_pi_pistol50'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_PISTOL50')
end)

defineItem({
    item = 'WEAPON_STUNGUN',
    formatname = 'Stungun',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Stungun description',
    model = 'w_pi_stungun'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_STUNGUN', 0)
end)

defineItem({
    item = 'WEAPON_KNIFE',
    formatname = 'Knife',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_KNIFE', 0)
end)

defineItem({
    item = 'WEAPON_DAGGER',
    formatname = 'Dague',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.8,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_DAGGER', 0)
end)

defineItem({
    item = 'WEAPON_CROWBAR',
    formatname = 'Pied de biche',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.8,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_CROWBAR', 0)
end)

defineItem({
    item = 'WEAPON_FLASHLIGHT',
    formatname = 'Lampe torche',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_FLASHLIGHT', 0)
end)

defineItem({
    item = 'WEAPON_GOLFCLUB',
    formatname = 'Club de Golf',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.5,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_GOLFCLUB', 0)
end)

defineItem({
    item = 'WEAPON_HAMMER',
    formatname = 'Marteau',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_HAMMER', 0)
end)

defineItem({
    item = 'WEAPON_HATCHET',
    formatname = 'Hachette',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_HATCHET', 0)
end)

defineItem({
    item = 'WEAPON_KNUCKLE',
    formatname = 'Poing américain',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_KNUCKLE', 0)
end)

defineItem({
    item = 'WEAPON_MACHETE',
    formatname = 'Machette',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MACHETE', 0)
end)

defineItem({
    item = 'WEAPON_SWITCHBLADE',
    formatname = 'Couteau à cran d\'arrêt',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SWITCHBLADE', 0)
end)

defineItem({
    item = 'WEAPON_NIGHTSTICK',
    formatname = 'Matraque',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_NIGHTSTICK', 0)
end)

defineItem({
    item = 'WEAPON_WRENCH',
    formatname = 'Clé à molette',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_WRENCH', 0)
end)

defineItem({
    item = 'WEAPON_BATTLEAXE',
    formatname = 'Hache de combat',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_BATTLEAXE', 0)
end)

defineItem({
    item = 'WEAPON_POOLCUE',
    formatname = 'Queue de billard',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_POOLCUE', 0)
end)

defineItem({
    item = 'WEAPON_SNSPISTOL',
    formatname = 'Pétoire',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SNSPISTOL', 0)
end)

defineItem({
    item = 'WEAPON_SNSPISTOL_MK2',
    formatname = 'Pistolet SNS MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SNSPISTOL_MK2', 0)
end)

defineItem({
    item = 'WEAPON_SNIPERRIFLE',
    formatname = 'PSG-1',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SNIPERRIFLE', 0)
end)

defineItem({
    item = 'WEAPON_HEAVYPISTOL',
    formatname = 'Pistolet Lourd',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_HEAVYPISTOL', 0)
end)

defineItem({
    item = 'WEAPON_HEAVYSNIPER',
    formatname = 'M107',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_HEAVYSNIPER', 0)
end)

defineItem({
    item = 'WEAPON_HEAVYSNIPER_MK2',
    formatname = 'Snipeur d\'élite MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 2,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_HEAVYSNIPER_MK2', 0)
end)

defineItem({
    item = 'WEAPON_VINTAGEPISTOL',
    formatname = 'Pistolet Vintage',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_VINTAGEPISTOL', 0)
end)

defineItem({
    item = 'WEAPON_FLAREGUN',
    formatname = 'Lance fusée de détresse',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1.3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_FLAREGUN', 0)
end)

defineItem({
    item = 'WEAPON_MARKSMANPISTOL',
    formatname = 'Thompson-Center Contender G2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MARKSMANPISTOL', 0)
end)

defineItem({
    item = 'WEAPON_REVOLVER',
    formatname = 'Revolver',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_REVOLVER', 0)
end)

defineItem({
    item = 'WEAPON_REVOLVER_MK2',
    formatname = 'Revolver MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_REVOLVER_MK2', 0)
end)

defineItem({
    item = 'WEAPON_DOUBLEACTION',
    formatname = 'Double Action',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_DOUBLEACTION', 0)
end)

defineItem({
    item = 'WEAPON_MICROSMG',
    formatname = 'UZI',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MICROSMG', 0)
end)

defineItem({
    item = 'WEAPON_SMG',
    formatname = 'MP5A',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SMG', 0)
end)

defineItem({
    item = 'WEAPON_SMG_MK2',
    formatname = 'SMG MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SMG_MK2', 0)
end)

defineItem({
    item = 'WEAPON_MACHINEPISTOL',
    formatname = 'TEC-9',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MACHINEPISTOL', 0)
end)

defineItem({
    item = 'WEAPON_MINISMG',
    formatname = 'Skorpion Vz. 61',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MINISMG', 0)
end)

defineItem({
    item = 'WEAPON_PUMPSHOTGUN',
    formatname = 'Remington 870',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_PUMPSHOTGUN', 0)
end)

defineItem({
    item = 'WEAPON_PUMPSHOTGUN_MK2',
    formatname = 'Fusil à Pompe MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_PUMPSHOTGUN_MK2', 0)
end)

defineItem({
    item = 'WEAPON_SAWNOFFSHOTGUN',
    formatname = 'Mossberg 500',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SAWNOFFSHOTGUN', 0)
end)

defineItem({
    item = 'WEAPON_MUSKET',
    formatname = 'Brown Bess Mousquet',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MUSKET', 0)
end)

defineItem({
    item = 'WEAPON_HEAVYSHOTGUN',
    formatname = 'Saiga-12K',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_HEAVYSHOTGUN', 0)
end)

defineItem({
    item = 'WEAPON_DBSHOTGUN',
    formatname = 'DBShotgun',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'DBSHOTGUN', 0)
end)

defineItem({
    item = 'WEAPON_COMBATSHOTGUN',
    formatname = 'Spas 12',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'COMBATSHOTGUN', 0)
end)

defineItem({
    item = 'WEAPON_ADVANCEDRIFLE',
    formatname = 'CTAR-21',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_ADVANCEDRIFLE', 0)
end)

defineItem({
    item = 'WEAPON_SPECIALCARBINE',
    formatname = 'G36',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SPECIALCARBINE', 0)
end)

defineItem({
    item = 'WEAPON_SPECIALCARBINE_MK2',
    formatname = 'Carabine Spéciale MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_SPECIALCARBINE_MK2', 0)
end)

defineItem({
    item = 'WEAPON_COMPACTRIFLE',
    formatname = 'Micro Draco AK Pistol',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_COMPACTRIFLE', 0)
end)

defineItem({
    item = 'WEAPON_MILITARYRIFLE',
    formatname = 'Steyr AUG',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MILITARYRIFLE', 0)
end)

defineItem({
    item = 'WEAPON_MG',
    formatname = 'PKP Pecheneg',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MG', 0)
end)

defineItem({
    item = 'WEAPON_GUSENBERG',
    formatname = 'Thompson SMG',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_GUSENBERG', 0)
end)

defineItem({
    item = 'WEAPON_MARKSMANRIFLE',
    formatname = 'M39 EMR',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MARKSMANRIFLE', 0)
end)

defineItem({
    item = 'WEAPON_MARKSMANRIFLE_MK2',
    formatname = 'Fusil de tireur d\'élite MK2',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 5,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MARKSMANRIFLE_MK2', 0)
end)

defineItem({
    item = 'WEAPON_RPG',
    formatname = 'RPG-7',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_RPG', 0)
end)

defineItem({
    item = 'WEAPON_GRENADELAUNCHER',
    formatname = 'Milkor MGL',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_GRENADELAUNCHER', 0)
end)

defineItem({
    item = 'WEAPON_MINIGUN',
    formatname = 'Minigun',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 4,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_MINIGUN', 0)
end)

defineItem({
    item = 'WEAPON_FIREWORK',
    formatname = 'Feu d\'artifice',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_FIREWORK', 0)
end)

defineItem({
    item = 'WEAPON_HOMINGLAUNCHER',
    formatname = 'SA-7 Grail',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_HOMINGLAUNCHER', 0)
end)

defineItem({
    item = 'WEAPON_COMPACTLAUNCHER',
    formatname = 'M79 GL',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 3,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_COMPACTLAUNCHER', 0)
end)

defineItem({
    item = 'WEAPON_FLARE',
    formatname = 'Fusée Détresse',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.6,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_FLARE', 0)
end)

defineItem({
    item = 'WEAPON_PETROLCAN',
    formatname = 'Jerrican Essence',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.4,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_PETROLCAN', 0)
end)

defineItem({
    item = 'GADGET_PARACHUTE',
    formatname = 'Parachute',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 1,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'GADGET_PARACHUTE', 0)
end)

defineItem({
    item = 'WEAPON_FIREEXTINGUISHER',
    formatname = 'Extincteur',
    type = 'weapon',
    tradable = true,
    candelete = true,
    weight = 0.7,
    stackable = false,
    description = 'Knife description',
    model = 'w_me_knife_01'
}, function(source, item, slot)
    TriggerClientEvent('AquiverInventory:useWeapon', source, 'WEAPON_FIREEXTINGUISHER', 0)
end)

RegisterNetEvent('AquiverInventory:reduceWeaponAmmo')
AddEventHandler('AquiverInventory:reduceWeaponAmmo', function(ammoType)
    local source = source
    local identifier = Config.getIdentifier(source)
    if ammoType then
        if AquiverInventories[identifier] then
            local response = AquiverInventories[identifier].removeItem(ammoType, 1)
        end
    end
end)
