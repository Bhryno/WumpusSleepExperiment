# Year 11 Software Design and Development Assessment Task 2
## Original Basic code
``` Basic
10 DEFINT A-Z: DIM R(19,3),P(1),B(1)
20 FOR I=0 TO 19: READ R(I,0),R(I,1),R(I,2): NEXT
30 INPUT "Enter a number";X: X=RND(-ABS(X))
40 PRINT: PRINT " HUNT THE WUMPUS "
50 PRINT "-----------------------": PRINT
60 FOR I=0 TO 1: GOSUB 500: P(I)=X: GOSUB 500: B(I)=X: NEXT
70 GOSUB 500: W=X: GOSUB 500: P=X
80 A=5
90 IF A=0 THEN 340
100 IF P=W THEN 410
110 IF P=B(0) OR P=B(1) THEN 360
120 IF P=P(0) OR P=P(1) THEN 390
130 PRINT: FOR I=0 TO 2
140 IF R(P,I)=W THEN PRINT "You smell something terrible nearby."
150 FOR J=0 TO 1
160 IF R(P,I)=B(J) THEN PRINT "You hear a rustling."
170 IF R(P,I)=P(J) THEN PRINT "You feel a cold wind blowing from a nearby cavern."
180 NEXT J,I
190 PRINT USING "You are in room ##. ";P;
200 PRINT USING "Tunnels lead to ##; ##; and ##.";R(P,0);R(P,1);R(P,2)
210 PRINT USING "You have # arrows.";A: PRINT
220 LINE INPUT "M)ove, S)hoot or Q)uit? ";I$
230 S=I$="S" OR I$="s": IF S OR I$="M" OR I$="m" THEN 260
240 IF I$="Q" OR I$="q" THEN END
250 PRINT "Sorry?": GOTO 220
260 INPUT "Which room";X: PRINT
270 IF X=R(P,0) OR X=R(P,1) OR X=R(P,2) THEN IF S THEN 290 ELSE P=X: GOTO 90
280 PRINT "Cannot get there from here.": GOTO 260
290 IF X=W THEN PRINT "Congratulations! You shot the wumpus!": GOTO 440
300 PRINT "You missed.": A=A-1: IF RND(1)<.25 THEN 90
310 PRINT "The wumpus wakes from his slumber."
320 X=RND(1)*3: IF R(R(W,X),3) THEN 320
330 R(W,3)=0: W=R(W,X): R(W,3)=1: GOTO 90
340 PRINT "As you grasp at your empty quiver, ";
350 PRINT "you hear a large beast approaching...": GOTO 410
360 PRINT "You have entered the lair of a large bat."
370 PRINT "It picks you up and drops you in room";
380 P=R(P,RND(1)*3): PRINT P;".": GOTO 90
390 PRINT "The ground gives way beneath your feet."
400 PRINT "You fall into a deep abyss.": GOTO 430
410 PRINT "You find yourself face to face with the wumpus."
420 PRINT "It eats you whole."
430 PRINT: PRINT "You have met your demise."
440 LINE INPUT "Another game (Y/N)?";I$
450 IF I$="Y" OR I$="y" THEN 60
460 IF I$<>"N" AND I$<>"n" THEN PRINT "Sorry?": GOTO 440
470 END
500 X=RND(1)*20: IF R(X,3)=0 THEN R(X,3)=1: RETURN ELSE 500
510 DATA 1,4,7, 0,2,9, 1,3,11, 2,4,13, 0,3,5
520 DATA 4,6,14, 5,7,16, 0,6,8, 7,9,17, 1,8,10
530 DATA 9,11,18, 2,10,12, 11,13,19, 3,12,14, 5,13,15
540 DATA 14,16,19, 6,15,17, 8,16,18, 10,17,19, 12,15,18
```

## Annotations
**DEFINT A-Z** is a basic inbuilt function that turns all variables that aren't a string, which are ones that don't have a ***$*** end indicator:
> **10** DEFINT A-Z: DIM R(19,3),P(1),B(1)

The ***For*** Loop collectes integers in an array of ***R***, where its minimum is 0 and maximum is 19 - this establishes each of the 20 room numbers:
> **20** FOR I=0 TO 19: READ R(I,0),R(I,1),R(I,2): NEXT

In line 30, a number can be entered to choose a room, then the code calculates a random number to place the Wumpus into a room that isn't the player's chosen room:
> **30** INPUT "Enter a number";X: X=RND(-ABS(X))

From lines 40-50, the console prints a bare bones screen text of the Wumpus' main title:
> **40** PRINT: PRINT " HUNT THE WUMPUS "
   **50** PRINT "-----------------------": PRINT

From lines 60-70, the code executes a subroutine with a thread sleep time of 500 ms, an array of ***P*** with an index of ***I*** being the actual player, represents the player controller and action of moving one room to another, and creates checks if the Player ***P*** is in the same room as the Wumpus ***W***:
> **60** FOR I=0 TO 1: GOSUB 500: P(I)=X: GOSUB 500: B(I)=X: NEXT
   **70** GOSUB 500: W=X: GOSUB 500: P=X

Line 80 is an initialiser for the amount of arrows you start with:
> **80** A=5

From lines 90-130, the code calculates the player's *room-choosing* decision, where each room the player enters has at most 3 separate tunnels leading to another room, not including the one where the player came from. The numbers of *340, 410, 360 and 390* are indexes/angles for these tunnels. The ***For*** loop in line 130 prints out the room options for the player in the console:
> **90** IF A=0 THEN 340
   **100** IF P=W THEN 410
   **110** IF P=B(0) OR P=B(1) THEN 360
   **120** IF P=P(0) OR P=P(1) THEN 390
   **130** PRINT: FOR I=0 TO 2

From lines 140-180, the code runs an infinite loop (***NEXT J,I***) to check if the Player is in an adjacent room coordinate to the Wumpus, bat or a pit. If these conditions are met the console will print out messages/hints for the player:
> **140** IF R(P,I)=W THEN PRINT "You smell something terrible nearby."
> **150** FOR J=0 TO 1
   **160** IF R(P,I)=B(J) THEN PRINT "You hear a rustling."
   **170** IF R(P,I)=P(J) THEN PRINT "You feel a cold wind blowing from a nearby cavern."
   **180** NEXT J,I

From lines 190-280, for every time the player makes a move into another room, the code prints out the room number and the coordinates of adjacent rooms connected to it. It also displays options of:
- [ ] Move?
- [ ] Shoot?
- [ ] Quit?

From lines 250-280, if the typed message doesn't match the expected list of answers, the console will ask the player to retype their answer:
> **190** PRINT USING "You are in room ##. ";P;
   **200** PRINT USING "Tunnels lead to ##; ##; and ##.";R(P,0);R(P,1);R(P,2)
   **210** PRINT USING "You have # arrows.";A: PRINT
   **220** LINE INPUT "M)ove, S)hoot or Q)uit? ";I$
   **230** S=I$="S" OR I$="s": IF S OR I$="M" OR I$="m" THEN 260
   **240** IF I$="Q" OR I$="q" THEN END
   **250** PRINT "Sorry?": GOTO 220
   **260** INPUT "Which room";X: PRINT
   **270** IF X=R(P,0) OR X=R(P,1) OR X=R(P,2) THEN IF S THEN 290 ELSE P=X: GOTO 90
   **280** PRINT "Cannot get there from here.": GOTO 260

From lines 290-310, the code only continues after several conditions:
- If the Wumpus is successfully killed, the game ends with the player's victory.
- If the arrow lands in a room adjacent to the Wumpus, the Wumpus will wake up and move to an another adjacent room away from the contact of the arrow.
> **290** IF X=W THEN PRINT "Congratulations! You shot the wumpus!": GOTO 440
   **300** PRINT "You missed.": A=A-1: IF RND(1)<.25 THEN 90
   **310** PRINT "The wumpus wakes from his slumber."

In line 320, to eliminate boilerplate code, if the player chooses a room, a player is placed into a random room from those 3 previous given choices. In line 330, player's position is ultimately reset to 0, that meaning that the new global origin of the map is set to that player's current position/room index. Additionally, throughout out both lines the code also continuously runs checks for Wumpus, Bat or pit presence.
> **320** X=RND(1)*3: IF R(R(W,X),3) THEN 320
   **330** R(W,3)=0: W=R(W,X): R(W,3)=1: GOTO 90

From lines 340 to 430, a sequence of line prints for different scenarios, e.g. alerts for lack of ammunition, dying to a pit of Wumpus. From lines 440-470, if the player dies, an Input is inserted asking if the user wishes to play another game. The code then runs checks for valid inputs and ends if the user requests "No".
> **340** PRINT "As you grasp at your empty quiver, ";
   **350** PRINT "you hear a large beast approaching...": GOTO 410
   **360** PRINT "You have entered the lair of a large bat."
   **370** PRINT "It picks you up and drops you in room";
   **380** P=R(P,RND(1)*3): PRINT P;".": GOTO 90
   **390** PRINT "The ground gives way beneath your feet."
   **400** PRINT "You fall into a deep abyss.": GOTO 430
   **410** PRINT "You find yourself face to face with the wumpus."
   **420** PRINT "It eats you whole."
   **430** PRINT: PRINT "You have met your demise."
   **440** LINE INPUT "Another game (Y/N)?";I$
   **450** IF I$="Y" OR I$="y" THEN 60
   **460** IF I$<>"N" AND I$<>"n" THEN PRINT "Sorry?": GOTO 440
   **470** END

Line 500 preloads the spawn room location by randomly selecting an integer from an array of 20, each representing a point of an icosahedron, which is a mapping for a room number. Additionally, the code checks that if the randomised array returned a null value of 0, it would set that integer/ room number to 1, else it would return a placeholder value of 500.
> **500** X=RND(1)*20: IF R(X,3)=0 THEN R(X,3)=1: RETURN ELSE 500

Lines 510-540 are single-key double-value data dictionaries(tri-consumers) for adjacent-point coordinates, essentially, point coordinates on the surface of an icosahedron as a key to room numbers in the map.
> **510** DATA 1,4,7, 0,2,9, 1,3,11, 2,4,13, 0,3,5
   **520** DATA 4,6,14, 5,7,16, 0,6,8, 7,9,17, 1,8,10
   **530** DATA 9,11,18, 2,10,12, 11,13,19, 3,12,14, 5,13,15
   **540** DATA 14,16,19, 6,15,17, 8,16,18, 10,17,19, 12,15,18

## Project Journal

## Structure Chart

## Data Dictionary
| **Name**          | **Data Type** | **Module**  | **Purpose**                                                                      |
|-------------------|---------------|-------------|----------------------------------------------------------------------------------|
| first_scene       | Scene         | MainMenu.gd | Function to get the “Map.tscn” scene.                                            |
| selector_1        | Node          | MainMenu.gd | Language feature to get internal Node of CenterContainer/HBoxContainer/Selector  |
| selector_2        | Node          | MainMenu.gd | Language feature to get internal Node of CenterContainer2/HBoxContainer/Selector |
| selector_3        | Node          | MainMenu.gd | Language feature to get internal Node of CenterContainer3/HBoxContainer/Selector |
| current_selection | Node          | MainMenu.gd |                                                                                  |
|                   |               |             |                                                                                  |
|                   |               |             |                                                                                  |
|                   |               |             |                                                                                  |
|                   |               |             |                                                                                  |
|                   |               |             |                                                                                  |
## Testing Strategies
| **Testing Number** | **Testing Stage** | **Time Taken** | **Score** |
|--------------------|-------------------|----------------|-----------|
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
|                    |                   |                |           |
## Source Code [](https://github.com/HairConditioner/WumpusSleepExperiment)

## Justification of Choice of Tier
In contrast to popular opinion, ***Godot Engine*** was more appropriate for this project than the ***Unity Game Engine*** because it is extremely lightweight, so much that it can integrate into the slow machines of the school's and has higher support for x32 computer systems and mobile development (generally slower devices) as it has multi-lingual & cross-platform support due to its open-source nature, whereas **Unity** is a closed-released licensed game engine with only desktop environment support. 

In addition to the Engine ***Godot's*** built-in custom language ***GDScript*** is a very effective and fast language as it eliminates a lot of boilerplate code seen in C-based languages such as ***C#***, the primary language for ***Unity***. 

Comparably, ***Godot***'s  GameObject structure of independent components of *Nodes* whereas ***Unity***'s *GameObject* components are more of a relationship between entities, and that they depend of each other to produce what is on your screen. This is turn, causes ***Godot***'s *Node* system to have much less errors than ***Unity***'s *GameObject*, and far superior as the chance of the program breaking down is much less.

## User Guide
### Objectives
 - It is your job to investigate captured and dead police officers within a haunted house.
 - Safely navigate your way around the various ink puddles in the Wumpus-infected house. These ink puddles may be a pit that sucks you in or the Wumpus itself, **BE CAREFUL**.
 - Collect pistol rounds from dead officers into your own revolver.
 - To complete the game, complete tasks and survive the Wumpus for 5 minutes until reinforcements arrive. Additionally, successfully killing the Wumpus is optional.
### Input Mechanics
 - **W**  - Foward
 - **A** - Left
 - **S** - Back
 - **D** - Right
 - **1** - Equip Fist
 - **2** - Equip Bow
 - **E** - Interact