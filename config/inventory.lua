---------------------------------------------------------------------------
-- Item Objects
---------------------------------------------------------------------------
XRPLifeConfig["inventory"].ItemObjects = {
    -- Weapns
    "w_ar_carbinerifle",
    "w_sg_pumpshotgun",
    "w_pi_stungun",
    "w_me_nightstick",

    -- Ammo
    "prop_box_ammo01a",

    -- Food
    "prop_food_bs_burg1",
    "ng_proc_beerbottle_01a",

    -- Medical
    "prop_cs_pills",
    "prop_paper_bag_01",

    -- Vehicle
    "prop_tool_box_04",
    "prop_tool_box_02",

    -- Criminal
    "prop_ing_crowbar",

    -- General
    "prop_cash_pile_02",

    -- Drugs
    "hei_prop_heist_weed_block_01b"
}

---------------------------------------------------------------------------
-- Item Information
---------------------------------------------------------------------------
XRPLifeConfig["inventory"].Items = {
    -- Primary Weapons
    ["AR-15"] = {label = "AR-15", itemType = "PrimaryWeapon", iconName = "AR-15.png", ammoType = "5.56 AMMO", object = "w_ar_carbinerifle", model = "weapon_carbinerifle"},
    ["Mossberg 590"] = {label = "Mossberg 590", itemType = "primaryWeapon", iconName = "Shotgun.png", ammoType = "12GA Buckshot", object = "w_sg_pumpshotgun", model = "weapon_pumpshotgun"},

    -- Secondary Weapons
    ["X26 Taser"] = {label = "X26 Taser", itemType = "SecondaryWeapon", iconName = "Taser.png", object = "w_pi_stungun", model = "weapon_stungun"},

    -- Melee Weapons
    ["Baton"] = {label = "Baton", itemType = "MeleeWeapon", iconName = "Baton.png", object = "w_me_nightstick", model = "weapon_nightstick"},

    -- Food
    ["Hamburger"] = {label = "Hamburger", itemType = "FoodItem", object = "prop_food_bs_burg1"},
    
    -- Drink
    ["Water"] = {label = "Water", itemType = "DrinkItem", object = "ng_proc_beerbottle_01a"},

    -- Medical
    ["Pain Pills"] = {label = "Pain Pills", itemType = "MedicalItem", object = "prop_cs_pills"},
    ["Medkit"] = {label = "Medkit", itemType = "MedicalItem", object = "prop_paper_bag_01"},

    -- Vehicle
    ["Engine Kit"] = {label = "Engine Kit", itemType = "VehicleItem", object = "prop_tool_box_04"},
    ["Tire Kit"] = {label = "Tire Kit", itemType = "VehicleItem", object = "prop_tool_box_02"},

    -- Criminal Items
    ["Lockpick"] = {label = "Lockpick", itemType = "CriminalItem", object = "prop_ing_crowbar"},

    -- General Item
    ["Cash"] = {label = "Cash", itemType = "GeneralItem", object = "prop_cash_pile_02"},

    -- Drug Item
    ["Marijuana Seed"] = {label = "Marijuana Seed", itemType = "DrugItem", object = "prop_paper_bag_01"},
    ["Harvested Marijuana"] = {label = "Harvested Marijuana", itemType = "DrugItem", object = "prop_paper_bag_01"},
    ["Processed Marijuana"] = {label = "Processed Marijuana", itemType = "DrugItem", object = "hei_prop_heist_weed_block_01b"},
    ["Marijuana Baggie"] = {label = "Marijuana Baggie", itemType = "DrugItem", object = "prop_paper_bag_01"}
}