#check for valid space
execute unless blocks ~-3 ~ ~-3 ~3 ~ ~3 ~ 300 ~ masked run return 0

scoreboard players set in math 1
scoreboard players set in1 math 10
function endless_city:rng/range

execute if score out math matches 1..7 if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/small_house ^2 ^-1 ^2 180
execute if score out math matches 1..7 if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/small_house ^2 ^-1 ^2 counterclockwise_90
execute if score out math matches 1..7 if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/small_house ^2 ^-1 ^2 none
execute if score out math matches 1..7 if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/small_house ^2 ^-1 ^2 none
execute if score out math matches 1..7 if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/small_house ^2 ^-1 ^2 clockwise_90

execute if score out math matches 8..9 if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/small_iron_tower ^2 ^-1 ^2 180
execute if score out math matches 8..9 if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/small_iron_tower ^2 ^-1 ^2 counterclockwise_90
execute if score out math matches 8..9 if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/small_iron_tower ^2 ^-1 ^2 none
execute if score out math matches 8..9 if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/small_iron_tower ^2 ^-1 ^2 none
execute if score out math matches 8..9 if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/small_iron_tower ^2 ^-1 ^2 clockwise_90

execute if score out math matches 10 if score $entity_rot endless_city.data matches 0 run function endless_city:buildings/gravel/rot_180_init
execute if score out math matches 10 if score $entity_rot endless_city.data matches 90 run function endless_city:buildings/gravel/rot_ccw_90_init
execute if score out math matches 10 if score $entity_rot endless_city.data matches -180 run function endless_city:buildings/gravel/rot_none_init
execute if score out math matches 10 if score $entity_rot endless_city.data matches 180 run function endless_city:buildings/gravel/rot_none_init
execute if score out math matches 10 if score $entity_rot endless_city.data matches -90 run function endless_city:buildings/gravel/rot_cw_90_init