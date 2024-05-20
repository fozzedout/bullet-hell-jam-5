extends Node

#	Common		green
#	Uncommon	blue
#	Rare		purple
#	Epic		red
#	Legendary	golden

@export var weapon_db = {
	Enums.WeaponName.PLASMA_PULSE: { "name": "Plasma Pulse", "rarity pct": 80, "rarity": "Common", "res": "plasma-pulse", "colour": "ffd700", "base rate": 0.5, "level rate": 0.05, "damage":1, "price":500 },
	Enums.WeaponName.NEUTRINO_SHOT: {"name": "Neutrino Shot", "rarity pct": 80, "rarity": "Common", "res": "neutrino-shot", "colour": "d7d7ff", "base rate": 0.25, "level rate": 0.025, "damage":2, "price":1600},
	Enums.WeaponName.VULKAN_CANNON: {"name": "Vulkan Cannon", "rarity pct": 60, "rarity": "Uncommon", "res": "vulkan-cannon", "colour": "ffd700", "base rate": 0.1, "level rate": 0.005, "damage":1, "price":1000 },
	Enums.WeaponName.DRAXIAN_PULSE: {"name": "Draxian Pulse", "rarity pct": 50, "rarity": "Uncommon", "res": "draxian-pulse", "colour": "00d730", "base rate": 0.5, "level rate": 0.05, "damage":1, "price":900 },
	Enums.WeaponName.THRAGUL_MINES: {"name": "Thra'gul Mines", "rarity pct": 40, "rarity": "Rare", "res": "thragul-mines", "colour": "ff0000", "base rate": 8.0, "level rate": 0.5, "damage":10, "price":200 },
	Enums.WeaponName.MEGA_BLAST: {"name": "Mega Blast", "rarity pct": 30, "rarity": "Rare", "res": "mega-blast", "colour": "ffd700", "base rate": 1, "level rate": 0.075, "damage":10, "price":1000 },
	Enums.WeaponName.CHRONON_BLAST: {"name": "Chronon Blast", "rarity pct": 20, "rarity": "Epic", "res": "chronon-blast", "colour": "ffd7ff", "base rate": 0.5, "level rate": 0.025, "damage":6, "price":2000 },
	Enums.WeaponName.ION_DISRUPTOR: {"name": "Ion Disruptor", "rarity pct": 10, "rarity": "Epic", "res": "ion-disruptor", "colour": "ffd7ff", "base rate": 0.2, "level rate": 0.025, "damage":7, "price":3000 },
	Enums.WeaponName.ZORTHIAN_LASER: {"name": "Zorthian Laser", "rarity pct": 2, "rarity": "Legendary", "res": "zorthian-laser", "colour": "ffff50", "base rate": 0.05, "level rate": 0.005, "damage":8, "price":5000 }
}

@export var ship_type_db = {
	Enums.ShipType.MINAHASA: { "name" : "Minahasa", "rarity pct": 80, "res" : "minahasa", "armour" : 100, "price": 6000},
	Enums.ShipType.PULSATRIX_MK1: { "name" : "Pulsatrix Mk1", "rarity pct": 70, "res" : "pulsatrix-mk1", "armour" : 120, "price": 8000},
	Enums.ShipType.PULSATRIX_MK3: { "name" : "Pulsatrix Mk3", "rarity pct": 80, "res" : "pulsatrix-mk2", "armour" : 140, "price": 12000},
	Enums.ShipType.SAWWHET: { "name" : "Saw-Whet", "rarity pct": 60, "res" : "sawwhet", "armour" : 160, "price": 15000},
	Enums.ShipType.STRIX: { "name" : "Strix", "rarity pct": 50, "res" : "strix", "armour" : 180, "price": 20000},
	Enums.ShipType.TAWNY: { "name" : "Tawny", "rarity pct": 70, "res" : "tawny", "armour" : 120, "price": 8000},
	Enums.ShipType.TILOPSIS_MK1: { "name" : "Tilopsis Mk1", "rarity pct": 60, "res" : "tilopsis-mk1", "armour" : 160, "price": 15000},
	Enums.ShipType.TILOPSIS_MK2: { "name" : "Tilopsis Mk2", "rarity pct": 50, "res" : "tilopsis-mk2", "armour" : 180, "price": 20000}
}

@export var engine_db ={
	Enums.EngineName.FURO: { "name" : "Furo", "rarity pct": 80, "res" : "furo", "speed" : 200, "price": 2000},
	Enums.EngineName.NIGRIPES: { "name" : "Nigripes", "rarity pct": 60, "res" : "nigripes", "speed" : 266, "price": 5000},
	Enums.EngineName.HAIDARUM: { "name" : "Haidarum", "rarity pct": 40, "res" : "haidarum", "speed" : 333, "price": 10000},
	Enums.EngineName.SABLE: { "name" : "Sable", "rarity pct": 20, "res" : "sable", "speed" : 400, "price": 20000},
}
