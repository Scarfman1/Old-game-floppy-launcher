-	intro
So, this is a "simple" script that checks for specific .txt files and runs respective game. These games aren’t mine, I found them on abandonware websites.
-	How it works:
The main launch script runs in launcher.bat. On winXP PCs hide.vbs is supposed to be put into startup folder in order to be functioning from the start. HOWEVER, this makes the PC check floppy drive every 2 seconds, so it is quite hefty on the floppy drive itself.
-	Launcher.bat explanation:
1.	CHECK function:
Basically bunch of if statements that check if there is a file on drive A (floppy drive), to add a new game, you have to specify a txt file (txt file itself can be empty, it’s just the name) and make a function RUN_GAME##
2.	RUN_GAME function:
Just checks into the directory for game EXE and puts it into GAME_EXE variable, also sets FLOPPY_FILE to game txt on floppy
3.	MONITOR_GAME function:
This is where the fun begins, so first, checks every two minutes, then, if it finds the txt (set in the FLOPPY_FILE var) and runs the game set in the GAME_EXE var
4.	The last part (game killer):
If there is no floppy, kills the process trough win task manager

-	How to add a game into this
You get the game, preferably .exe and just add it into launcher.bat. I have good experience with DOSBox and ZDoom, if you prefer any other, be my guest (what can I do about it?)
