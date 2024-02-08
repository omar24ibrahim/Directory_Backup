# Name: BackupScript
	Creator: Omar Ibrahim Elsayed 7442

# Description:
The script aims to check a directory after a certain period of time repeatedly and create a backup directory if this directory is changed whether by adding, deleting or modifying any files or subdirectories in it.

# Content:
The is folder contains the following:
-
 -Shell file called "backupd.sh" holding the bash script needed to perform this backup task
 
  "The script creates an initial backup as soon as it is runned and creates two files for holding the last and newest modifications then compare the last backup with the current state of the folder and creates new backup if they differ from each other. If the number of backups exceeded a certain value the oldest backup will be deleted."

 -Makefile that eases the program run

 -Folder called "Trial" holding the files and subdirectories that are going to be processed by the shell file

# Requirements:
Install Make

# User Manual:
You should follow these steps in order to make ful use of this program:
-
 1-Insert all your files and subdirectories to be checked in the Trial folder

 2-Open the terminal and run the following commands in this order:
 
	cd (enter the project folder directory for example: Desktop/7442-lab4)
	make

 3-Now the script is running with these properties:
	Backup is saved in a folder called Try
	Checking for any modifications of the original folder every 60 secs
	Maximum number of saved backups is 5
	Each backup folder is named by year-month-day-hour-minute-second describing the backup folder creation date
	In order to edit any of these properties open the Makefile and edit the sent arguments following this order: directory backup_directory time_interval_in_seconds maximum_number_of_backup_folders
