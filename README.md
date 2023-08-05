# Endless City

A 1.20+ Minecraft datapack which turns the overworld into an infinitely generating city, designed to be easily expandable to allow players to craft their own experience. You are free to completely change the buildings and road structures, and add to the pack in any way, however if you publish any form of content using this pack or a modified variant of it, please credit me. 

## How to install

First download the repository as a `.zip` file. Then drag and drop that file into the "datapack selection" part of the world creation screen and enable it. Do not change the 'World Type' setting, but changing anything else (gamerules, difficulty et cetera) is fine.

## Notes on usage

For performance reasons it is very important that players configure their render distance stat to match their _server-side_ render distance (i.e. even if they have a render distance of 16, if the server is capped at 12 they need to give 12). It defaults to 12, but if you are using a render distance lower than this it is especially important that you specify it. If you have a higher render distance on the other hand, having it set lower has no negative performance impact, but can cause things to look strange, particuarly when looking from a high vantage point. Configuring can easily be done through the `/trigger city_menu` command, and a prompt is given on login. Please do not disable this, since attempting to generate the city outside of render distance can cause significant lag spikes.

# Customising the pack

## Loot tables

To modify the loot tables of the existing structures, simply extract the datapack and navigate to `data\endless_city\loot_tables\chests\`. You can then modify or replace any of the 4 loot tables within that folder, just ensure you leave the file names the same.

## Building chances

You can fairly simply make the existing buildings more or less common. The buildings are divided into several categories:
1. Decoration pillars
2. Archways
3. Small buildings (5x5)
4. Medium buildings (7x7)
5. Large buildings (13x13)
6. Long buildings (29x21)

Note that categories can contain smaller buildings, the given sizes are the maximum for each category.

Each time a building generates, it has a chance to decay down to the category beneath it. (Both long and large buildings decay to medium buildings). The code for this is found in `data\endless_city\functions\buildings\generate_<building type>.mcfunction`
The rng code looks like the following:
``` mcfunction
scoreboard players set in math <minimum value>
scoreboard players set in1 math <maximum value>
function endless_city:rng/range
```
The value is then used like so (taken from the large building file):
``` mcfunction
execute store success score $large_override endless_city.data if score out math matches 1 run function endless_city:buildings/generate_medium
execute if score $large_override endless_city.data matches 1 run return 0
```
The important part is on the first line, checks the random value against a specified constant value:
``` mcfunction
if score out math matches 1
```
You can change both the range of values and this value to get any decay chance you want. For instance, for a 33% chance to decay, you would set the minimum to `1`, the maximum to `3`, and leave the check at `1`. If you wanted a 40% (2 in 5), you would set the minimum to `1`, the maximum to `5`, and set the check to `1..2` - the `..` means any number between the two values, inclusive. 

This rng system is also used to choose between buildings within a category. For instance, the small buildings category contains 3 different structures: a stone brick building, a iron building and a gravel tower. The chance for each of these to generate when a small building generates uses exactly the same concept, and therefore can be customised in the same way. This again occurs in `data\endless_city\functions\buildings\generate_<building type>.mcfunction`

The code for the small buildings (with repeat lines for different orientations ommited) is as follows:
``` mcfunction
scoreboard players set in math 1
scoreboard players set in1 math 10
function endless_city:rng/range

execute if score out math matches 1..7 if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/small_house ^2 ^-1 ^2 180

execute if score out math matches 8..9 if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/small_iron_tower ^2 ^-1 ^2 180

execute if score out math matches 10 if score $entity_rot endless_city.data matches 0 run function endless_city:buildings/gravel/rot_180_init
```
This gives a 70% chance for a stone brick house, a 20% chance for a iron tower and a 10% chance for a gravel tower. Again, this is completely customisable, and you can even remove buildings entirely. Ensure you change the all the chances so its the same for all the orientations (the lines are grouped together to make it clear), and avoid overlaps between the categories since this can cause both buildings to generate in the same locations. 

# Modifying the road tiles

Using the helper datapack (Available as a seperate github repository), you can more easily modify the existing road structures, mainly rearranging or modifying the building and decoration markers. 

With marker displays toggled on, you can easily remove existing markers, and also change their rotation. Note that for simplicity, the markers for the decoration pillars always face north, and are in the north-east corner of the 2x2 area they take up. (You can point them in other directions, but they would need to be in a different corner - just imagine rotating the whole structure around its centre and work out where the north-east block moves to). All other markers are positioned at the centre of the structure the place

Install the pack in the same way (ideally on a superflat world) and use `/trigger help` to show a guide and the main commands.

Note that if you want to change the blocks which the road is built from, you will need to modify the block tag located at `data\endless_city\tags\blocks\road_blocks.json`. Ensure this contains all the blocks used in the main parts of the road (not including the border), and that none of these blocks are also used in the terrain around the roads.

You will also need to change the following lines in the initialise function (`data\endless_city\functions\init.mcfunction`):
``` mcfunction
setblock 0 63 17 minecraft:gray_concrete
setblock 0 63 -17 minecraft:gray_concrete
setblock 17 63 0 minecraft:gray_concrete
setblock -17 63 0 minecraft:gray_concrete
```
You want to replace `minecraft:gray_concrete` with one of your road blocks - which one doesnt matter, so long as it is in the block tag.

If you change the terrain blocks, you may also want to modify the bases of the buildings so they use the same block. Importantly, the gold building uses a block variant which looks the same - this is important to prevent generation bugs, so if you change this block too it must not be the same as the default terrain. You will then need to add the new block to the block tag at `data\endless_city\tags\blocks\invalid_blocks.json`. You should replace the `minecraft:cobblestone_slab` with the block(s) you have changed it to.

## Changing the size of the road tiles

_IMPORTANT - The road tiles must be square, and the side length must be odd._

If you have changed the size of the road tiles, you will need to also change some values in a few files. 

Firstly, in the initialise function (`data\endless_city\functions\init.mcfunction`), you will need to change the same lines given above which you (may have) modified for changing the road tile blocks in the __Modifying the road tiles__ section.

This time, you need to change the `x` and `z` values in the coordinates. These numbers need to be changed to half of your tile size, rounded up. For instance, if your new tiles were 43x43, the commands would use 22 instead of 17. _Make sure you keep the negative signs the same._

You will then need to change the summon commands just below
``` mcfunction
summon minecraft:marker -33 64 0 {Tags:["city_generator"]}
summon minecraft:marker 33 64 0 {Tags:["city_generator"]}
summon minecraft:marker 0 64 -33 {Tags:["city_generator"]}
summon minecraft:marker 0 64 33 {Tags:["city_generator"]}
```
Again, you will be changing the `x` and `z` values, this time replacing them with the size of your new tiles.

Once you have modified the initialise file, you will then need to modify the road generation file (`data\endless_city\functions\generate.mcfunction`). The replacements are all the same, and I won't list all the lines here since that would be overkill. Simply put, wherever you see a set of relative coordinates using either 17 or 33 e.g.:
``` mcfunction
setblock ~17 ~ ~
setblock ~33 ~ ~
```
you should replace them with the values for your new tile size, using the same logic given above. #

## Adding new buildings

Adding new buildings within the existing size categories is fairly simple. To use the medium buildings as an example, you would first need to create a building within a 7x7 block footprint, then save the structure file and move it into the datapack (ideally to the folder `data\endless_city\structures\buildings\`)

Then, inside the medium building generation file (`data\endless_city\functions\buildings\generate_medium.mcfunction`), you would need to add the following lines to the end of the file:
``` mcfunction
execute if score out math matches <rng value> if score $entity_rot endless_city.data matches 0 run place template endless_city:buildings/<structure name> ^3 ^-2 ^3 180
execute if score out math matches <rng value> if score $entity_rot endless_city.data matches 90 run place template endless_city:buildings/<structure name> ^3 ^-2 ^3 counterclockwise_90
execute if score out math matches <rng value> if score $entity_rot endless_city.data matches -180 run place template endless_city:buildings/<structure name> ^3 ^-2 ^3 none
execute if score out math matches <rng value> if score $entity_rot endless_city.data matches 180 run place template endless_city:buildings/<structure name> ^3 ^-2 ^3 none
execute if score out math matches <rng value> if score $entity_rot endless_city.data matches -90 run place template endless_city:buildings/<structure name> ^3 ^-2 ^3 clockwise_90
```
You would then need to modify the rng portion of the file in the same way as detailed above in the __Building Chances__ section, so that your new building is generated. 
Note that if your building has some form of directionality, the "front" should be facing north when you build and save it to the structure file. 

__IMPORTANT:__

If you are creating a structure which has a large enough area for other buildings to spawn inside of it, including a 1-block buffer zone (e.g. a 9x9 space could allow a 7x7 building to spawn in it, but an 8x9 space wouldnt), you will need to add the floor block of that building to the `invalid_blocks` tag (`data\endless_city\tags\blocks\invalid_blocks.json`). This will prevent that from happening. If the floor block for the building is the same as the terrain, you should _not_ put that block in the tag, instead you should replace the floor block with a variant of the terrain block, like how the gold building uses double slabs for the flooring of its courtyard. 

This is an unfortunate side-effect of the way the generation works, since the markers are generally close together to create a more random pattern, and prevent gaps if larger buildings decay down to smaller ones - I am working on potential solutions but at the moment this is the best one, primarily for performance reasons. 

If you want to add larger buildings than spaces available, firstly you may want to increase the tile size for the roads to better accomodate these new buildings. After that, you can either try to replicate the code for one of the other categories, or modify an existing category. The latter option is definitely easier, although may not be possible if you want many more categories. To replicate the code, note that there are several seperate files involved, and you may also want to modify the helper datapack to display the markers for your new category.

I am not going to provide a detailed guide on these processes since it would take too long - if you do want some sort of guide or for me to add the category for you (no promises - it depends on whether I have the time...) then you can reach out to me via discord (enigmatek). (If there does end up being a lot of demand I may produce some sort of guide though.)