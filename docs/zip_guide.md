---
title:  Zip File Guide
---

# Unzipping Files

## Windows

Navigate your file explorer and navigate to your Downloads folder (or wherever you downloaded the file). From there, look for the file you downloaded, right-click, and select "Extract All…".
When the "Extract Compressed (Zipped) Folder" window opens, click the "Extract" button.

## Linux

This guide is assuming you have Zip/Unzip installed on your Linux distribution.
If this is not the case, first follow this [install guide](https://www.tecmint.com/install-zip-and-unzip-in-linux/).

### Using the graphical interface

Normally, a simple [right click and choose "Extract" or "Open with Ark"](https://www.wikihow.com/Unzip-Files-in-Linux) should do it.

### Using the Command-Line

Navigate to your command-line interface and run the following command (as a normal user, as indicated by `$`):

```{.text}
$ unzip [FileName].zip
```

where "[FileName].zip" is the name of the zip file.


## macOS

Simply double-click on the zip file to unzip it onto your desktop.

# Zipping Files

## Windows

Navigate to your file explorer and go to where your solution is stored on your system, the default file path being:

```{.text}
C:\Users\[UserName]\source\repos
```

where "[UserName]" is your Windows username (on school computers, this should be your AU username).
Right click the folder you want to zip, go down the list to the "Send to" option, and then click on the "Compressed (Zipped) Folder" option.
This should then create a new zip file.

## Linux

### Using the graphical interface

Normally, a simple [right click and choose "Compress"](https://www.wikihow.com/Make-a-Zip-File-in-Linux) should do it.

### Using the Command-Line

Navigate to your command-line interface and run the following command (as a normal user, as indicated by `$`):

```{.text}
$ zip -r [ZipFileName].zip [FileName]
```

where "[ZipFileName].zip" is the name you want for the zip file, and "[FileName]" for the folder you want to zip.

## macOS

Navigate to your file explorer and go to where your solution is stored on your system, the default file path being:

```{.text}
[UserName]\source\repos
```

where "[UserName]" is your Mac username.
Right-click on the folder that you want to zip up and click on the "Compress the Folder" option.
