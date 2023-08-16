tag @s add endless_city.modified

data remove entity @s Offers.Recipes[{sell:{id:"minecraft:oak_sapling"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:spruce_sapling"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:birch_sapling"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:jungle_sapling"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:dark_oak_sapling"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:acacia_sapling"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:cherry_sapling"}}]
data remove entity @s Offers.Recipes[{sell:{id:"minecraft:mangrove_propagule"}}]

scoreboard players set in math 1
scoreboard players set in1 math 2
function endless_city:rng/range

execute if score out math matches 1 run return 1
data modify entity @s Offers.Recipes append value {xp:1, buy: {id:"minecraft:emerald",Count:1b},sell:{id:"minecraft:air",Count:0b},uses:0,priceMultiplier:0.05f,maxUses:12,rewardExp:1b,demand:0,specialPrice:0,buyB:{id:"minecraft:air",Count:0b}}

scoreboard players set in math 1
scoreboard players set in1 math 5
function endless_city:rng/range

execute if score out math matches 1 run data modify entity @s Offers.Recipes[-1].sell merge value {id:"minecraft:pink_petals",Count:1b}
execute if score out math matches 2 run data modify entity @s Offers.Recipes[-1].sell merge value {id:"minecraft:sunflower",Count:1b}
execute if score out math matches 3 run data modify entity @s Offers.Recipes[-1].sell merge value {id:"minecraft:lilac",Count:1b}
execute if score out math matches 4 run data modify entity @s Offers.Recipes[-1].sell merge value {id:"minecraft:rose_bush",Count:1b}
execute if score out math matches 5 run data modify entity @s Offers.Recipes[-1].sell merge value {id:"minecraft:peony",Count:1b}