execute store success score $large_override endless_city.data unless blocks ^-7 ^1 ^-7 ^7 ^1 ^7 ~ 300 ~ masked
execute if score $large_override endless_city.data matches 1 run function endless_city:buildings/generate_medium
execute if score $large_override endless_city.data matches 1 run return 0

# chance to place a medium building instead of a large one
scoreboard players set in math 1
scoreboard players set in1 math 5
function endless_city:rng/range
execute store success score $large_override endless_city.data if score out math matches 1 run function endless_city:buildings/generate_medium
execute if score $large_override endless_city.data matches 1 run return 0

scoreboard players set in math 1
scoreboard players set in1 math 1
function endless_city:rng/range

execute if score out math matches 1 if score $entity_rot endless_city.data matches 0 run function endless_city:buildings/large/rot_180_init
execute if score out math matches 1 if score $entity_rot endless_city.data matches 90 run function endless_city:buildings/large/rot_ccw_90_init
execute if score out math matches 1 if score $entity_rot endless_city.data matches -180 run function endless_city:buildings/large/rot_none_init
execute if score out math matches 1 if score $entity_rot endless_city.data matches 180 run function endless_city:buildings/large/rot_none_init
execute if score out math matches 1 if score $entity_rot endless_city.data matches -90 run function endless_city:buildings/large/rot_cw_90_init