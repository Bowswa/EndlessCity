#if insufficient space, attempt to place a medium building
execute store success score $long_override endless_city.data unless blocks ^-13 ^1 ^-11 ^13 ^1 ^11 ~ 300 ~ masked
execute if score $long_override endless_city.data matches 1 run function endless_city:buildings/generate_medium
execute if score $long_override endless_city.data matches 1 run return 0

#chance to place a medium building instead of the long one - very high since the gold building 
#shouldnt be extremely common, and it spawns on some of the most common tiles
scoreboard players set in math 1
scoreboard players set in1 math 10
function endless_city:rng/range
execute store success score $long_override endless_city.data if score out math matches ..9 run function endless_city:buildings/generate_medium
execute if score $long_override endless_city.data matches 1 run return 0

scoreboard players set in math 1
scoreboard players set in1 math 1
function endless_city:rng/range

execute if score out math matches 1 if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/gold_building ^13 ^-5 ^10 180
execute if score out math matches 1 if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/gold_building ^13 ^-5 ^10 counterclockwise_90
execute if score out math matches 1 if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/gold_building ^13 ^-5 ^10 none
execute if score out math matches 1 if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/gold_building ^13 ^-5 ^10 none
execute if score out math matches 1 if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/gold_building ^13 ^-5 ^10 clockwise_90