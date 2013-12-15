

My Entry for Ludum Dare 28 - Theme "You only get one" 
-------------------------

### Game Idea

It is a Osmos/Spore/CellCraft/Flow combination.
You will only get one (biological) cell.
But you can improve your cell!
Collect useful things like chloroplasts, cell membran parts, energy storages and more useful things.
At first you are only a little core that has a little energy storage and can be moved. But be careful 
moving consumes energy. If your internal energy is depleted you won't be able to move anymore.
So you have to collect and/or produce more energy.


### Stack

* FlashDevelop
* ActionScript3
* Ash Framework
* Data Structures For Games (http://polygonal.github.io/ds/)
* SmartGit
* bfxr (http://www.bfxr.net/)
* AudaCity

### Todo
* Refactoring:
	one and only CollisionSystem that stores info about collisions in compononents 
	energycollectingcollisionsystem and solidcollisionssystem will only use collision compononent info
* add spatial hashing (in progress)
* add spatial hashing using CollisionSystem
 



* add MembranPart entities that connect to each other at their two ends

* add randomly distorted vector field that has influence on moving things to simulate a dynamic primeval soup

### Current Live Version can be viewed here:

http://xaedes.de/dev/ld28/
	
Controls: WASD