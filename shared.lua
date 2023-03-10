Shared = {}

Shared.prefix = "zedkover:"

Shared.Locale = "fr"
Shared.IncludeCash = true
Shared.IncludeAccounts = true
Shared.ExcludeAccountsList = {"bank", "money"}
Shared.OpenControl = 289

Shared.CloseUiItems = {
    "carteidentite",
    "permis",
    "carte",
    "bread",
    "soda",
    "water",
    "frites",
    "cheeseburger",
}

Shared.Blacklistitem = {
    ["gps"] = true,
    ["phone"] = true
}

-- Weapon Item

SharedWeapons = {}
SharedWeapons.Weapons = {
  WEAPON_KNIFE = { item = 'weapon_knife', label = ('weapon_knife') },
  WEAPON_NIGHTSTICK = { item = 'weapon_nightstick', label = ('weapon_nightstick') },
  WEAPON_HAMMER = { item = 'weapon_hammer', label = ('weapon_hammer') },
  WEAPON_BAT = { item = 'weapon_bat', label = ('weapon_bat') },
  WEAPON_GOLFCLUB = { item = 'weapon_golfclub', label = ('weapon_golfclub') },
  WEAPON_CROWBAR = { item = 'weapon_crowbar', label = ('weapon_crowbar') },
  WEAPON_PISTOL = { item = 'weapon_pistol', label = ('weapon_pistol') },
  WEAPON_COMBATPISTOL = { item = 'weapon_combatpistol', label = ('weapon_combatpistol') },
  WEAPON_APPISTOL = { item = 'weapon_appistol', label = ('weapon_appistol') },
  WEAPON_PISTOL50 = { item = 'weapon_pistol50', label = ('weapon_pistol50') },
  WEAPON_MICROSMG = { item = 'weapon_microsmg', label = ('weapon_microsmg') },
  WEAPON_SMG = { item = 'weapon_smg', label = ('weapon_smg') },
  WEAPON_ASSAULTSMG = { item = 'weapon_assaultsmg', label = ('weapon_assaultsmg') },
  WEAPON_ASSAULTRIFLE = { item = 'weapon_assaultrifle', label = ('weapon_assaultrifle') },
  WEAPON_CARBINERIFLE = { item = 'weapon_carbinerifle', label = ('weapon_carbinerifle') },
  WEAPON_ADVANCEDRIFLE = { item = 'weapon_advancedrifle', label = ('weapon_advancedrifle') },
  WEAPON_MG = { item = 'weapon_mg', label = ('weapon_mg') },
  WEAPON_COMBATMG = { item = 'weapon_combatmg', label = ('weapon_combatmg') },
  WEAPON_PUMPSHOTGUN = { item = 'weapon_pumpshotgun', label = ('weapon_pumpshotgun') },
  WEAPON_SAWNOFFSHOTGUN = { item = 'weapon_sawnoffshotgun', label = ('weapon_sawnoffshotgun') },
  WEAPON_ASSAULTSHOTGUN = { item = 'weapon_assaultshotgun', label = ('weapon_assaultshotgun') },
  WEAPON_BULLPUPSHOTGUN = { item = 'weapon_bullpupshotgun', label = ('weapon_bullpupshotgun') },
  WEAPON_STUNGUN = { item = 'weapon_stungun', label = ('weapon_stungun') },
  WEAPON_SNIPERRIFLE = { item = 'weapon_sniperrifle', label = ('weapon_sniperrifle') },
  WEAPON_HEAVYSNIPER = { item = 'weapon_heavysniper', label = ('weapon_heavysniper') },
  WEAPON_REMOTESNIPER = { item = 'weapon_remotesniper', label = ('weapon_remotesniper') },
  WEAPON_GRENADELAUNCHER = { item = 'weapon_grenadelauncher', label = ('weapon_grenadelauncher') },
  WEAPON_RPG = { item = 'weapon_rpg', label = ('weapon_rpg') },
  WEAPON_MINIGUN = { item = 'weapon_minigun', label = ('weapon_minigun') },
  WEAPON_GRENADE = { item = 'weapon_grenade', label = ('weapon_grenade') },
  WEAPON_STICKYBOMB = { item = 'weapon_stickybomb', label = ('weapon_stickybomb') },
  WEAPON_SMOKEGRENADE = { item = 'weapon_smokegrenade', label = ('weapon_smokegrenade') },
  WEAPON_BZGAS = { item = 'weapon_bzgas', label = ('weapon_bzgas') },
  WEAPON_MOLOTOV = { item = 'weapon_molotov', label = ('weapon_molotov') },
  WEAPON_FIREEXTINGUISHER = { item = 'weapon_fireextinguisher', label = ('weapon_fireextinguisher') },
  WEAPON_PETROLCAN = { item = 'weapon_petrolcan', label = ('weapon_petrolcan') },
  WEAPON_BALL = { item = 'weapon_ball', label = ('weapon_ball') },
  WEAPON_SNSPISTOL = { item = 'weapon_snspistol', label = ('weapon_snspistol') },
  WEAPON_BOTTLE = { item = 'weapon_bottle', label = ('weapon_bottle') },
  WEAPON_GUSENBERG = { item = 'weapon_gusenberg', label = ('weapon_gusenberg') },
  WEAPON_SPECIALCARBINE = { item = 'weapon_specialcarbine', label = ('weapon_specialcarbine') },
  WEAPON_HEAVYPISTOL = { item = 'weapon_heavypistol', label = ('weapon_heavypistol') },
  WEAPON_BULLPUPRIFLE = { item = 'weapon_bullpuprifle', label = ('weapon_bullpuprifle') },
  WEAPON_DAGGER = { item = 'weapon_dagger', label = ('weapon_dagger') },
  WEAPON_VINTAGEPISTOL = { item = 'weapon_vintagepistol', label = ('weapon_vintagepistol') },
  WEAPON_FIREWORK = { item = 'weapon_firework', label = ('weapon_firework') },
  WEAPON_MUSKET = { item = 'musket', label = ('weapon_musket') },
  WEAPON_HEAVYSHOTGUN = { item = 'weapon_heavyshotgun', label = ('weapon_heavyshotgun') },
  WEAPON_MARKSMANRIFLE = { item = 'weapon_marksmanrifle', label = ('weapon_marksmanrifle') },
  WEAPON_HOMINGLAUNCHER = { item = 'weapon_hominglauncher', label = ('weapon_hominglauncher') },
  WEAPON_PROXMINE = { item = 'weapon_proxmine', label = ('weapon_proxmine') },
  WEAPON_SNOWBALL = { item = 'weapon_snowball', label = ('weapon_snowball') },
  WEAPON_FLAREGUN = { item = 'weapon_flaregun', label = ('weapon_flaregun') },
  WEAPON_GARBAGEBAG = { item = 'weapon_garbagebag', label = ('weapon_garbagebag') },
  WEAPON_HANDCUFFS = { item = 'weapon_handcuffs', label = ('weapon_handcuffs') },
  WEAPON_COMBATPDW = { item = 'weapon_combatpdw', label = ('weapon_combatpdw') },
  WEAPON_MARKSMANPISTOL = { item = 'weapon_marksmanpistol', label = ('weapon_marksmanpistol') },
  WEAPON_KNUCKLE = { item = 'weapon_knuckle', label = ('weapon_knuckle') },
  WEAPON_CERAMICPISTOL = { item = 'weapon_ceramicpistol', label = ('weapon_ceramicpistol') },
  WEAPON_HATCHET = { item = 'weapon_hatchet', label = ('weapon_hatchet') },
  WEAPON_MACHETE = { item = 'weapon_machete', label = ('weapon_machete') },
  WEAPON_MACHINEPISTOL = { item = 'weapon_machinepistol', label = ('weapon_machinepistol') },
  WEAPON_SWITCHBLADE = { item = 'weapon_switchblade', label = ('weapon_switchblade') },
  WEAPON_REVOLVER = { item = 'weapon_revolver', label = ('weapon_revolver') },
  WEAPON_DBSHOTGUN = { item = 'weapon_dbshotgun', label = ('weapon_dbshotgun') },
  WEAPON_COMPACTRIFLE = { item = 'weapon_compactrifle', label = ('weapon_compactrifle') },
  WEAPON_AUTOSHOTGUN = { item = 'weapon_autoshotgun', label = ('weapon_autoshotgun') },
  WEAPON_BATTLEAXE = { item = 'weapon_battleaxe', label = ('weapon_battleaxe') },
  WEAPON_COMPACTLAUNCHER = { item = 'weapon_compactlauncher', label = ('weapon_compactlauncher') },
  WEAPON_MINISMG = { item = 'weapon_minismg', label = ('weapon_minismg') },
  WEAPON_PIPEBOMB = { item = 'weapon_pipebomb', label = ('weapon_pipebomb') },
  WEAPON_POOLCUE = { item = 'weapon_poolcue', label = ('weapon_poolcue') },
  WEAPON_WRENCH = { item = 'weapon_wrench', label = ('weapon_wrench') },
  WEAPON_FLASHLIGHT = { item = 'weapon_flashlight', label = ('weapon_flashlight') },
  GADGET_NIGHTVISION = { item = 'gadget_nightvision', label = ('gadget_nightvision') },
  GADGET_PARACHUTE = { item = 'gadget_parachute', label = ('gadget_parachute') },
  WEAPON_FLARE = { item = 'weapon_flare', label = ('weapon_flare') }
}

SharedWeapons.AmmoTypes = {
  AMMO_PISTOL = { item = 'ammo_pistol' },
  AMMO_SMG = { item = 'ammo_smg' },
  AMMO_RIFLE = { item = 'ammo_rifle' },
  AMMO_MG = { item = 'ammo_smg_large' },
  AMMO_SHOTGUN = { item = 'ammo_shotgun' },
  AMMO_SNIPER = { item = 'ammo_snp' },
  AMMO_RPG = { item = 'ammo_rpg' },
  AMMO_HOMINGLAUNCHER = { item = 'ammo_rpg' },
  AMMO_FIREWORK = { item = 'ammo_rpg' },
  AMMO_FLAREGUN = { item = 'weapon_flare' },
}
