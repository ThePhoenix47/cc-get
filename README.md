#CC-GET
To be short, this is **IT**.
"It" is apt-get for ComputerCraft. It makes it easy to install all those scripts you see in the forum posts,
don't worry about pastebin, startup scripts, ...! CC-GET does it all automatically. It uses the same Syntax as apt-get,
making it easy to use if you ever used a debian-like OS, for example Ubuntu.
Unlike apt-get, it doesn't keep a local package list, because the data overhead is minimal and it is so easy to forget to update it,
so you just do `cc-get upgrade` and it does all the updating for you.

##Syntax
Using CC-GET is easy, you only need a few simple commands:

`cc-get install program` installs the program *program* on your System. It is stored in `/bin/cc-get/` and can be easily and completely
removed using `cc-get remove program`.

`cc-get upgrade` installs all pending updates for any packages.

`cc-get installed` lists all installed packages.

##Installing
Don't use this GitHub repository for installing, for you don't want to be a git. Use PasteBin instead: run the installer by typing `pastebin run PKieqe7w` in your computer, and just start using cc-get!

##Developers
If you are a developer and want your program to be added to the cc-get package repositories, submit it as a pull request to this repository or via PM in ComputerCraft Forums.
###Package format
The `package.inf` file consists of three parts: version, files and dependencies. It is a table created using `textutils.serialize()` containing a number and two subtables. Instead of each of the subtables, `"none"` may be used to signalize the table would be empty. This is done to avoid problems with referencing to `nil` when testing whether the tables exist.
####Version
Version is an integer incremented any time a change is made. At the next `cc-get upgrade`, new versions are downloaded. In this process, only the subdirectory `data` is kept. Data and settings should be stored there.
####Files
Usually, a program should only contain the executables created for the user and perhaps data in a subdirectories. Please do not add other subdirectories, and only add executables to be used by the user in the package, and add needed data files to `data`, because the package root of non-libraries is added to path.

If you need any other files (Libraries, etc.), put them in another package and depend on that. If you need a library created by someone else and it is not in the repository, tell me, and I will  ask the creator for permission to add it.
####Dependencies
The Dependencies should be a table of package names of anything your program needs to run. Don't worry, if something is already installed, it will not be re-downloaded. Just add what you need, and if you outsource files to create a library, please give it a name ending with lib, so that it is not added to the path and does not bother the user. Also, please give all library files the ending .lua, just for differencing them from executables. In your code, you may import these Libraries by using `os.loadAPI("/bin/cc-get/packages/(libname)/(file).lua")`.
####Virtual Packages
If you have created any kind of program suite, add the different programs as different packages so each may be installed alone, and create a package that has no files and depends on all the programs. Only the programs, not the dependencies, because these are loaded recursively when the programs themselves are loaded.