#if insufficient space, attempt to place a small building
execute store success score $medium_override endless_city.data unless blocks ~-4 ~ ~-4 ~4 ~ ~4 ~ 300 ~ masked
execute if score $medium_override endless_city.data matches 1 run function endless_city:buildings/generate_small
execute if score $medium_override endless_city.data matches 1 run return 0

#chance to place a small building instead of the large one 
scoreboard players set in math 1
scoreboard players set in1 math 5
function endless_city:rng/range
execute store success score $medium_override endless_city.data if score out math matches ..3 run function endless_city:buildings/generate_small
execute if score $medium_override endless_city.data matches 1 run return 0

scoreboard players set in math 1
scoreboard players set in1 math 2
function endless_city:rng/range

execute if score out math matches 1 if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/ruin ^3 ^-1 ^3 180
execute if score out math matches 1 if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/ruin ^3 ^-1 ^3 counterclockwise_90
execute if score out math matches 1 if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/ruin ^3 ^-1 ^3 none
execute if score out math matches 1 if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/ruin ^3 ^-1 ^3 none
execute if score out math matches 1 if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/ruin ^3 ^-1 ^3 clockwise_90

execute if score out math matches 2 if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/sandpit ^3 ^-2 ^3 180
execute if score out math matches 2 if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/sandpit ^3 ^-2 ^3 counterclockwise_90
execute if score out math matches 2 if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/sandpit ^3 ^-2 ^3 none
execute if score out math matches 2 if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/sandpit ^3 ^-2 ^3 none
execute if score out math matches 2 if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/sandpit ^3 ^-2 ^3 clockwise_90