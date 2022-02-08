---
title:  Zip File Guide
---

# Unzipping Files

## Windows
Navigate your file explorer and navigate to your Downloads folder (or wherever you downloaded the file). From there, look for the file you downloaded, right-click, and select "Extract All...." When the "Extract Compressed (Zipped) Folder" window opens, click the "Extract" button.

## Linux
(This guide is assuming you have Zip/Unzip installed on your Linux distribution. If this is not the case, first follow this [install guide](https://www.tecmint.com/install-zip-and-unzip-in-linux/)).

Navigate to your command-line interface and run the following command:
```
$ unzip [FileName].zip
```
where "[FileName]" is the name of the zip folder. If the folder is not in the usual directory, run:
```
$ unzip filename.zip -d /path/to/directory
```
where "/path/to/directory" is the respective path to that zip file.

## Mac
Simply double-click on the zip file to unzip it onto your desktop.

# Zipping Files

## Windows
Navigate to your file explorer and go to where your solution is stored on your system, the default file path being:
```
C:\Users\[UserName]\source\repos
```
where "[UserName]" is your Windows username (on school computers, this should be your AU username). Right click the folder you want to zip, go down the list to the "Send to" option, and then click on the "Compressed (Zipped) Folder" option. This should then create a new zip file that you can rename and submit.

## Linux
Navigate to your command-line interface and run the following command:
```
$ zip -r [ZipFileName].zip [FileName]
```
where "[ZipFileName]" is the name you want for the zip file, and "[FileName]" for the folder you want to zip.

## Mac
Navigate to your file explorer and go to where your solution is stored on your system, the default file path being:
```
[UserName]\source\repos
```
where "[UserName]" is your Mac username. Right-click on the folder that you want to zip up and click on the "Compress the Folder" option.


<!-- I'm not sure if there is an easier way to zip/unzip files in Linux, so I just put down what I found online -->
