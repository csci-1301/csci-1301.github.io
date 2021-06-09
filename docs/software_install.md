---
title: Installing Software
---


# Generalities on Installing Software

You probably already installed a software in your life, be it [VLC](http://www.videolan.org/), [Microsoft Teams](https://www.microsoft.com/en-us/microsoft-teams/download-app), or [Whatsapp](https://www.whatsapp.com/).
However, depending on if you installed it on a phone, a tablet, a computer, and depending on the operating systems (Android, Windows 10, iOS, Ubuntu, etc.) your experience may have varied drastically.

Between the [Play store](https://en.wikipedia.org/wiki/Google_Play#Play_Store_on_Android), the [command-line interface](https://en.wikipedia.org/wiki/Command-line_interface), [homebrew](http://brew.sh/) and the act of downloading a software using your browser and then installing it using the navigator, there can be a lot of differences, but in all those circumstances you should keep security in mind.
In addition of making sure that you are downloading the software from a trusted source, you should also be vigilant about the information the software will be able to access about e.g. your private life.

As data can be lost or corrupted upon downloading, many plat-form now uses [checksum](https://en.wikipedia.org/wiki/Checksum) to verify the integrity of the software you downloaded before installing it.
This is an excellent practise that can also be performed "by hand", as explained for instance for [the database manager MySQL](https://dev.mysql.com/doc/refman/8.0/en/verifying-package-integrity.html): the main idea is that the probability of the signature matching a tampered-with file is extremely low, and that as long as you are downloading the signature and the software from two different sources, you are considerably reducing the [attack surface](https://en.wikipedia.org/wiki/Attack_surface).

# Executing Code Found on-line

As you progress in this class, you will be asked more and more to download and execute code hosted [in our repository](https://github.com/csci-1301/csci-1301.github.io/).
How can you tell that you can trust this code?

We have not implemented a checksum-matching (yet!), but you can trust this code as it was coded by your instructors, and hosted on a plat-form using [two-factor authentication](https://docs.github.com/en/github/authenticating-to-github/about-two-factor-authentication) and were every action is tracked using [versioning](https://en.wikipedia.org/wiki/Software_versioning).
Concretely, this means that only somebody who manages to steal your instructor's credentials, their phone, and thwart all the other instructor's vigilance would be able to host malicious code on our plat-form: while we certainly imagine that this is theoretically possible, we hope that you will agree that the probability is low enough for you to trust the code on this site.

As often, security is not absolute, but aims at providing reasonable confidence.
Executing "blindly" code found on-line, on the other hand, gives a good chance of facing unpleasant surprises: while there certainly is a lot of useful, good code on websites like [stackoverflow](https://stackoverflow.com/)---your instructor probably uses such websites, by the way!---, copying-and-pasting it without understanding its purpose or general structure is almost guaranteed to, at best, not execute properly, at worst, make your system unstable or insecure.

# Accessing an IDE

An [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment), for "Integrated development environment", is the software or service you will be using to write, compile, execute and debug your code. 
There are many available IDEs, and some can accomodate multiple different programming languages.

For C#, [there are many different possibilities](https://en.wikipedia.org/wiki/Comparison_of_integrated_development_environments#C%23): some are cross-platforms (meaning you can use them on macOS, windows or Linux), some are provided free of charge, some have not been updated in a long time.
Three natural choices are [Visual Studio](https://visualstudio.microsoft.com/), [MonoDevelop](https://www.monodevelop.com/) and [Rider](https://www.jetbrains.com/rider/features/).
While the last two are accessible on every operating systems, Visual Studio is available only for windows, and in a slightly different version for macOS.

To access one or the other, you will need either

- a computer with the right to install software on it,
- to access one of the computers in the [computer lab](https://www.augusta.edu/its/computers-printing.php), or
- a computer with internet access.

The third solution is a backup plan, as instead you will access a very minimal version of an IDE to test small snippets of code.
You should not rely on it for the duration of this course.

## Installing an Ide  On Your Own Computer

This part gathers some references for you to install [Visual Studio](https://visualstudio.microsoft.com/), [MonoDevelop](https://www.monodevelop.com/) and [Rider](https://www.jetbrains.com/rider/features/) on your own computer, regardless of your operating system.
It is strongly encouraged that you do so, especially if you want to continue in a CS/IT/Cyber degree, but is not mandatory^[Unless this class is fully online, of course.].

The instructions are detailed, but there are plenty of ways this can go wrong: make sure you have read and followed those instructions carefully before [asking for help](labs/Introduction/#how-to-ask-a-question)!

### Installing Visual Studio On Your Own Computer

Note that we are *not* installing "Visual Studio *code*", but simply "Visual Studio".

#### For Windows {#install-win}

#. Visit [Azure Dev Tools for Teaching](https://aka.ms/devtoolsforteaching).
#. Log in using your Augusta University credentials.
#. Select "Download software". 
#. Look for Visual Studio. The path is Education → Software → Visual Studio Enterprise 2019. You can search "Services" for the "Education" group and then click "Software" if the education group is not immediately displayed. It should look like the following:

    ![](./img/dl_VS.jpg){ width=80% }
    
    Normally, the following direct link should get you to the right page: <https://portal.azure.com/?Microsoft_Azure_Education_correlationId=8ee63052-dc32-46f7-a109-e26793622dbf#>. Type "Education" in the search bar to get started on the path to the program to download.

#. Download and install Visual Studio (leave all the options on their default settings). 

    If possible, check the box next to "Workload" → "Windows" → ".NET-Desktop Development", or to "Workload" → "Other Toolsets" → ".NET Core cross-platform development":


   ![](img/install_option.jpeg){ width=80% }

#. Enter the product key you obtained previously, following [the instructions in the documentation](https://docs.microsoft.com/en-us/visualstudio/ide/how-to-unlock-visual-studio?view=vs-2019).
Normally, clicking on "View key" on the screen pictured in the fourth step above should give you access to a key, that you simply need to copy-and-paste in the menu you can access on Visual Studio by clicking on "Select File" → "Account Settings" → "License with a Product Key".

#### For Mac

Download a version of Visual Studio at <https://visualstudio.microsoft.com/vs/mac/>. It differs a bit from the Windows version, but that should not impact your experience in this class. The only Visual Studio feature we rely on is the ability to create "Console Apps with C#", which is equally available in both the Windows and Mac versions.

### Installing MonoDevelop On Your Own Computer

Unfortunately, MonoDevelop offers pre-packaged release only for linux distributions

- If you are using linux (e.g. Ubuntu, Debian, etc.), then please head out to [MonoDevelop's download page](https://www.monodevelop.com/download/#fndtn-download-lin).
- If you are using MacOS, you can [have a look at the compilation instructions](https://www.monodevelop.com/developers/building-monodevelop/#macos), but it is very likely that you will find them impossible to understand.
- If you are using Windows, you can [have a look at the compilation instructions](https://www.monodevelop.com/developers/building-monodevelop/#windows), but it is very likely that you will find them impossible to understand.

### Installing Rider On Your Own Computer

You can download Rider [from their website](https://www.jetbrains.com/rider/download/), for any operating system.
Note that, as a student, you can [obtain a licence for free](https://www.jetbrains.com/community/education/#students): simply [fill this form](https://www.jetbrains.com/shop/eform/students), making sure you use your @augusta.edu email account, and you should receive a free licence instantaneously!

Note that jetbrains offers to use a SHA-256 checksum (for instance, [for the linux version](https://download.jetbrains.com/rider/JetBrains.Rider-2021.1.2.tar.gz.sha256)) for you to check that your download has not been tampered with.
In any case, you can [consult their detailled instructions](https://www.jetbrains.com/help/rider/Installation_guide.html#standalone) to install and execute Rider on any operating system.

### Installing Anything Anywhere

If the IDE you would like to adopt is not available for your operating system, you can use a [Virtual Machine](https://en.wikipedia.org/wiki/Virtual_machine) manager to run a linux-based distribution or a windows-image on top of your operating system.

For this, and regardless of your current operating system, you will need a [Virtual Machine](https://en.wikipedia.org/wiki/Virtual_machine) manager.

#. You can use 
    #. "VMware Fusion 11.x Pro" (only for MacOS, available on [OnTheHub](https://e5.onthehub.com/WebStore/OfferingDetails.aspx?o=cff1cf98-42ce-e811-810b-000d3af41938&pmv=00000000-0000-0000-0000-000000000000&ws=2020165a-723a-de11-b696-0030485a8df0&vsro=8)),
    #. [Virtual Box](https://www.virtualbox.org/) (for Linux and Mac),
    #. [Virtual Machine Manager](https://virt-manager.org/) (for Linux).
#. Download a version of "Microsoft Operating Systems" from [Azure Dev Tools for Teaching](https://aka.ms/devtoolsforteaching), or a linux-based distribution (typically, [ubuntu](https://ubuntu.com/appliance/vm) has a good reputation of being accessible and user-friendly).
#. Install and run your version of Windows or Linux from your virtual machine, and follow the corresponding instructions to install the IDE you are interested in.

Note that [it is illegal to run macOS in a virtual environment that is not hosted on a mac computer](https://law.stackexchange.com/q/18282), which drastically reduces the interest for you to consider this option.

## Accessing One of the Computers in a Computer Lab

Please refer to [this page from AU's Information Technology](https://www.augusta.edu/its/computers-printing.php) to know where the computer labs are located.
Visual Studio should be pre-installed on every computer.

## Compiling Code On-Line

_As a backup or only to test snippets of code_, you can compile C# code online.
Multiple online platforms exist, such as:

- <https://www.tutorialspoint.com/compile_csharp_online.php>
- <https://www.onlinegdb.com/online_csharp_compiler>
- <https://www.jdoodle.com/compile-c-sharp-online/>
- <https://dotnetfiddle.net/>
- <https://www.w3schools.com/cs/trycs.asp?filename=demo_helloworld>

Note that none of them are endorsed by the school and that they can pose security and privacy challenges: never enter any sensitive information and do not rely on them too heavily.
However, they can be a good support if you would like to test a short snippet of code but do not have access at the moment to a computer with MonoDevelop or Visual Studio installed.
