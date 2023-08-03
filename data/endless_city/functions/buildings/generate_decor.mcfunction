execute store result score $entity_rot endless_city.data run data get entity @s Rotation[0]
kill @s
execute if block ~ ~-1 ~ cobblestone_slab run return 0
execute if block ~ ~-1 ~ coal_block run return 0

# chance to not generate
scoreboard players set in math 1
scoreboard players set in1 math 6
function endless_city:rng/range
execute unless score out math matches 1 run return 0

#check for valid space
execute unless blocks ^ ^1 ^ ^-1 ^1 ^-1 ~ 300 ~ masked run return 0

execute if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/diamond_pillar ~ ~ ~ 180
execute if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/diamond_pillar ~ ~ ~ counterclockwise_90
execute if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/diamond_pillar ~ ~ ~ none
execute if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/diamond_pillar ~ ~ ~ none
execute if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/diamond_pillar ~ ~ ~ clockwise_90