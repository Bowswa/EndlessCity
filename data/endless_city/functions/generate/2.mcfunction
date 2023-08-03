execute as @e[type=minecraft:marker,tag=city_generator,limit=25,sort=nearest,distance=..32] at @s run function endless_city:generate

execute as @e[type=minecraft:marker,tag=large_building_generator,limit=2,sort=nearest,distance=..32] at @s run function endless_city:buildings/pregen_large
execute as @e[type=minecraft:marker,tag=long_building_generator,limit=5,sort=nearest,distance=..32] at @s run function endless_city:buildings/pregen_long
execute as @e[type=minecraft:marker,tag=medium_building_generator,limit=8,sort=nearest,distance=..16] at @s run function endless_city:buildings/pregen_medium
execute as @e[type=minecraft:marker,tag=small_building_generator,limit=8,sort=nearest,distance=..16] at @s run function endless_city:buildings/pregen_small
execute as @e[type=minecraft:marker,tag=decor_generator,limit=5,sort=nearest,distance=..32] at @s run function endless_city:buildings/generate_decor
execute as @e[type=minecraft:marker,tag=arch_generator,limit=5,sort=nearest,distance=..32] at @s run function endless_city:buildings/generate_arch