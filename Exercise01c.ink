/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 * Add four more knots
 * Assign at least TWO new variables through player choices
 * Print at least one of the variables to the player in a passage
 * Check the value of a variable and have it do something
*/

VAR Health = 5
VAR pet_name = ""
VAR name = ""
VAR torches = 0
VAR chocolate_bar = 1

-> memory

== memory ==
Before you stands the Cavern of Stalactitus. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Oates] 
    ~ pet_name = "Oates"
    ~ name = "Mr. Hall"
    -> cave_mouth
* [Otie]
    ~ pet_name = "Otie"
    ~ name = "Mr. Garfield"
    -> cave_mouth
* [Otis]
    ~ pet_name = "Otis"
    ~ name = "Mr. Redding"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave, {name}. If only {pet_name} could see you right now!

You have {torches} torches.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
* [Check for food] -> food_check

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches  > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. It is very dark, you can't see anything.
{ pet_name == "Otis": Otis would love it here in the west.}
* [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
-> END

== west_tunnel_lit ==
The light of your torch reveals an arrow pointing deeper into the cave.
{pet_name == "Oates": Remembering Oates, you know he would've ran down the cave without a second thought.}
* [Go Back] ->cave_mouth
-> END

== food_check ==
You currently have {Health} health points. You check your pocket to find {chocolate_bar} chocolate bar.
* [Eat Chocolate Bar] -> add_health
+ [Go Back] -> cave_mouth
-> END

== add_health ==
You ate a chocolate bar. You gained {chocolate_bar} health points. Your health is now at {Health + chocolate_bar} health points.
~ Health = Health + chocolate_bar
~ chocolate_bar = chocolate_bar - 1
{pet_name == "Otie": Thank goodness Otie isn't here, or he would've tried to eat your chocolate bar. That could've been bad!}
* [Go Back] -> cave_mouth
-> END
