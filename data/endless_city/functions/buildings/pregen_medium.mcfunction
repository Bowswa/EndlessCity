execute if block ~ ~-1 ~ cobblestone_slab run return 0
execute if block ~ ~-1 ~ coal_block run return 0

# setting the max offset for the buildings to 2 blocks in either direction
scoreboard players set in math -2
scoreboard players set in1 math 2
function endless_city:offset

execute if entity @s store result score $entity_rot endless_city.data run data get entity @s Rotation[0]
kill @s
execute at @s run function endless_city:buildings/generate_medium