execute as @a at @s run function endless_city:gen_loop_2

execute as @e[type=minecraft:marker,tag=wood_placement,limit=1] at @s run function endless_city:buildings/gold_wood_randomise

execute as @e[type=minecraft:marker,tag=floor_replacement,limit=1] at @s run function endless_city:buildings/gold_floor_replace

schedule function endless_city:gen_loop 2t