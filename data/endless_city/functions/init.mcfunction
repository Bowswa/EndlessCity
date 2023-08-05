summon minecraft:marker 0 64 0 {Tags:["city_generator"]}
setblock 0 63 17 minecraft:gray_concrete
setblock 0 63 -17 minecraft:gray_concrete
setblock 17 63 0 minecraft:gray_concrete
setblock -17 63 0 minecraft:gray_concrete
execute as @e[type=minecraft:marker,tag=city_generator] at @s run function endless_city:generate
summon minecraft:marker -33 64 0 {Tags:["city_generator"]}
summon minecraft:marker 33 64 0 {Tags:["city_generator"]}
summon minecraft:marker 0 64 -33 {Tags:["city_generator"]}
summon minecraft:marker 0 64 33 {Tags:["city_generator"]}


execute as @e[type=minecraft:marker,tag=city_generator] at @s run function endless_city:generate
execute as @e[type=minecraft:marker,tag=city_generator] at @s run function endless_city:generate
execute as @e[type=minecraft:marker,tag=city_generator] at @s run function endless_city:generate
setworldspawn 0 65 0
gamerule spawnRadius 0

scoreboard players set setup endless_city.data 1