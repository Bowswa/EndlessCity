execute store result score $entity_rot endless_city.data run data get entity @s Rotation[0]
kill @s
execute if block ~ ~-1 ~ cobblestone_slab run return 0
execute if block ~ ~-1 ~ coal_block run return 0

# chance to not generate
scoreboard players set in math 1
scoreboard players set in1 math 4
function endless_city:rng/range
execute unless score out math matches 1 run return 0

#check for valid space
execute unless blocks ^-2 ^1 ^ ^2 ^1 ^ ~ 300 ~ masked run return 0

execute if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/redstone_arch ^2 ^ ^ 180
execute if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/redstone_arch ^2 ^ ^ counterclockwise_90
execute if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/redstone_arch ^2 ^ ^ none
execute if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/redstone_arch ^2 ^ ^ none
execute if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/redstone_arch ^2 ^ ^ clockwise_90