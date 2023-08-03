# setting the max offset for the buildings to 1 block in either direction
scoreboard players set in math -1
scoreboard players set in1 math 1
function endless_city:offset

execute store result score $entity_rot endless_city.data run data get entity @s Rotation[0]
kill @s
execute at @s run function endless_city:buildings/generate_large