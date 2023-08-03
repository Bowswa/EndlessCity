execute if score @s render_distance matches 2.. run scoreboard players remove @s render_distance 1

scoreboard players set @s rd 0
scoreboard players enable @s rd
tellraw @s [{"text": "Render distance:       ","color": "gold"},{"text": "<<","color": "red","clickEvent": {"action": "run_command","value": "/trigger rd set -1"}},{"text": "  "},{"score": {"name": "@s","objective": "render_distance"},"color": "white","hoverEvent": {"action": "show_text","value": "Configured render distance"}},{"text": "  "},{"text": ">>","color": "green","clickEvent": {"action": "run_command","value": "/trigger rd set 1"}}]