scoreboard players set sides endless_city.data 0
execute store result score $straight endless_city.data store result score $corner endless_city.data store result score $dead endless_city.data store result score $t endless_city.data run scoreboard players set $cross endless_city.data 0
scoreboard players set in math 1
scoreboard players set in1 math 5

scoreboard players set should_randomise endless_city.data 0
execute if block ~ ~-1 ~-17 #endless_city:road_blocks run scoreboard players operation sides endless_city.data += #north endless_city.data
execute if block ~ ~-1 ~-17 minecraft:air store success score should_randomise endless_city.data run function endless_city:rng/range
execute if score should_randomise endless_city.data matches 1 if score out math matches 4.. run scoreboard players operation sides endless_city.data += #north endless_city.data

scoreboard players set should_randomise endless_city.data 0
execute if block ~ ~-1 ~17 #endless_city:road_blocks run scoreboard players operation sides endless_city.data += #south endless_city.data
execute if block ~ ~-1 ~17 minecraft:air store success score should_randomise endless_city.data run function endless_city:rng/range
execute if score should_randomise endless_city.data matches 1 if score out math matches 4.. run scoreboard players operation sides endless_city.data += #south endless_city.data

scoreboard players set should_randomise endless_city.data 0
execute if block ~17 ~-1 ~ #endless_city:road_blocks run scoreboard players operation sides endless_city.data += #east endless_city.data
execute if block ~17 ~-1 ~ minecraft:air store success score should_randomise endless_city.data run function endless_city:rng/range
execute if score should_randomise endless_city.data matches 1 if score out math matches 4.. run scoreboard players operation sides endless_city.data += #east endless_city.data

scoreboard players set should_randomise endless_city.data 0
execute if block ~-17 ~-1 ~ #endless_city:road_blocks run scoreboard players operation sides endless_city.data += #west endless_city.data
execute if block ~-17 ~-1 ~ minecraft:air store success score should_randomise endless_city.data run function endless_city:rng/range
execute if score should_randomise endless_city.data matches 1 if score out math matches 4.. run scoreboard players operation sides endless_city.data += #west endless_city.data

#reduce dead-ending
execute if score sides endless_city.data matches 1 if block ~ ~-1 ~17 minecraft:air run scoreboard players operation sides endless_city.data += #south endless_city.data
execute if score sides endless_city.data matches 4 if block ~ ~-1 ~-17 minecraft:air run scoreboard players operation sides endless_city.data += #north endless_city.data
execute if score sides endless_city.data matches 2 if block ~-17 ~-1 ~ minecraft:air run scoreboard players operation sides endless_city.data += #west endless_city.data
execute if score sides endless_city.data matches 8 if block ~17 ~-1 ~ minecraft:air run scoreboard players operation sides endless_city.data += #east endless_city.data


execute if score sides endless_city.data matches 0..7 run function endless_city:tree/0_7
execute if score sides endless_city.data matches 8..15 run function endless_city:tree/8_15

scoreboard players set $X endless_city.data -16
scoreboard players set $Y endless_city.data -1
scoreboard players set $Z endless_city.data -16

#---------------------------------#
#1 is default rotation
#if 2, swap and invert X
execute if score $rot endless_city.data matches 2 run scoreboard players operation $X endless_city.data >< $Z endless_city.data
execute if score $rot endless_city.data matches 2 run scoreboard players operation $X endless_city.data *= #-1 endless_city.data
#if 3, invert both data
execute if score $rot endless_city.data matches 3 run scoreboard players operation $X endless_city.data *= #-1 endless_city.data
execute if score $rot endless_city.data matches 3 run scoreboard players operation $Z endless_city.data *= #-1 endless_city.data
#if 4, swap and invert Z
execute if score $rot endless_city.data matches 4 run scoreboard players operation $X endless_city.data >< $Z endless_city.data
execute if score $rot endless_city.data matches 4 run scoreboard players operation $Z endless_city.data *= #-1 endless_city.data
#---------------------------------#

setblock ~ ~ ~ minecraft:structure_block
data merge block ~ ~ ~ {mode:"LOAD",integrity:1.0f,showboundingbox:0b,ignoreEntities:0b}
execute store result block ~ ~ ~ posX int 1 run scoreboard players get $X endless_city.data
execute store result block ~ ~ ~ posY int 1 run scoreboard players get $Y endless_city.data
execute store result block ~ ~ ~ posZ int 1 run scoreboard players get $Z endless_city.data

execute if score $empty endless_city.data matches 1 run data modify block ~ ~ ~ name set value "endless_city:empty"
execute if score $straight endless_city.data matches 1 run data modify block ~ ~ ~ name set value "endless_city:straight"
execute if score $corner endless_city.data matches 1 run data modify block ~ ~ ~ name set value "endless_city:corner"
execute if score $dead endless_city.data matches 1 run data modify block ~ ~ ~ name set value "endless_city:dead_end"
execute if score $t endless_city.data matches 1 run data modify block ~ ~ ~ name set value "endless_city:t_junction"
execute if score $cross endless_city.data matches 1 run data modify block ~ ~ ~ name set value "endless_city:cross"

execute if score $rot endless_city.data matches 1 run data modify block ~ ~ ~ rotation set value "None"
execute if score $rot endless_city.data matches 2 run data modify block ~ ~ ~ rotation set value "CLOCKWISE_90"
execute if score $rot endless_city.data matches 3 run data modify block ~ ~ ~ rotation set value "CLOCKWISE_180"
execute if score $rot endless_city.data matches 4 run data modify block ~ ~ ~ rotation set value "COUNTERCLOCKWISE_90"

setblock ~ ~1 ~ minecraft:redstone_block
fill ~ ~0 ~ ~ ~1 ~ minecraft:air

execute if block ~-17 ~-1 ~ minecraft:air positioned ~-33 ~ ~ unless entity @e[type=minecraft:marker,tag=city_generator,distance=..0.1] run summon minecraft:marker ~ ~ ~ {Tags:["city_generator"]}
execute if block ~17 ~-1 ~ minecraft:air positioned ~33 ~ ~ unless entity @e[type=minecraft:marker,tag=city_generator,distance=..0.1] run summon minecraft:marker ~ ~ ~ {Tags:["city_generator"]}
execute if block ~ ~-1 ~17 minecraft:air positioned ~ ~ ~33 unless entity @e[type=minecraft:marker,tag=city_generator,distance=..0.1] run summon minecraft:marker ~ ~ ~ {Tags:["city_generator"]}
execute if block ~ ~-1 ~-17 minecraft:air positioned ~ ~ ~-33 unless entity @e[type=minecraft:marker,tag=city_generator,distance=..0.1] run summon minecraft:marker ~ ~ ~ {Tags:["city_generator"]}

kill @s[tag=city_generator]