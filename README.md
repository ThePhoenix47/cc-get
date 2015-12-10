#CC-GET
To be short, this is **IT**.
"It" is apt-get for ComputerCraft. It makes it easy to install all those scripts you see in the forum posts,
don't worry about pastebin, startup scripts, ...! CC-GET does it all automatically. It uses the same Syntax as apt-get,
making it easy to use if you ever used a debian-like OS, for example Ubuntu.
Unlike apt-get, it doesn't keep a local package list, because the data overhead is minimal and it is so easy to forget to update it,
so you just do `cc-get upgrade` and it does all the updating for you.

##Syntax
Using CC-GET is easy, you only need a few simple commands:

`cc-get install *program*` installs the program *program* on your System. It is stored in `/bin/cc-get/` and can be easily and completely
removed using `cc-get remove *program*`.

`cc-get upgrade` installs all pending updates for any packages.

`cc-get installed` lists all installed packages.

##Installing
Don't use this GitHub repository for installing, for you don't want to be a git. Use PasteBin instead: run the installer by typing `pastebin run PKieqe7w` in your computer, and just start using cc-get!
