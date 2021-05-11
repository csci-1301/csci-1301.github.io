# Installing Software

<!-- these are copy pasted from initial matrix, edward's lab 1 -->

Instructions to set up a working environment for completing programming tasks.

<!-- 
and the course administrators' contact information to make sure you know how to reach your instructors.
This first part will address three of your instructor and undegraduate teaching assistant needs:

#. We would like to get to know you.
#. We need to know which lab session is the most suited for you.
#. We need to make sure you know how to reach out to us.

For the first two parts, please complete the survey on D2L called "Getting to know you + Pick your lab!".
For the last part, make sure you've read Dr. Aubert's email "CSCI 1301 -- Second contact" sent on 08/10, and that you have access to the "CSCI 1301 -- Fall 2020 -- Section A & B" team on Teams.
Don't hesitate to say, "hi" in the chat room!
-->

# Accessing And Using Visual Studio

The software we will primarily be using this semester is called Visual Studio.
This part will detail how to access it.
You will need either

- a computer with the right to install software on it,
- to access one of the computers in the [computer lab](https://www.augusta.edu/its/computers-printing.php), or
- a computer with internet access.

The third solution is a backup plan, as instead you will access a very minimal version of Visual Studio to test small snippets of code.
You should not rely on it for the duration of this course.


## Installing Visual Studio On Your Own Computer

This part gathers some references for you to install Visual Studio on your own computer, regardless of your operating system.
Note that we are *not* installing "Visual Studio *code*", but simply "Visual Studio"
It is strongly encouraged that you do so, especially if you want to continue in a CS/IT/Cyber degree, but is not mandatory^[Unless we have to move fully online at some point in the semester.].
The instructions are not very detailed: feel free to look for set-up help on the internet, from your classmates, and from your instructors.

There are plenty of ways this can go wrong: make sure you have read and followed those instructions carefully before asking for help!

### For Windows {#install-win}

#. Visit [Azure Dev Tools for Teaching](https://aka.ms/devtoolsforteaching).
#. Log in using your Augusta University credentials.
#. Select "Download software". 
#. Look for Visual Studio. The path is Education → Software → Visual Studio Enterprise 2019. You can search "Services" for the "Education" group and then click "Software" if the education group is not immediately displayed. It should look like the following:

    ![](img/dl_VS.jpg){ width=80% }
    
    Normally, the following direct link should get you to the right page: <https://portal.azure.com/?Microsoft_Azure_Education_correlationId=8ee63052-dc32-46f7-a109-e26793622dbf#>. Type "Education" in the search bar to get started on the path to the program to download.

#. Download and install Visual Studio (leave all the options on their default settings). 

    If possible, check the box next to "Workload" → "Windows" → ".NET-Desktop Development", or to "Workload" → "Other Toolsets" → ".NET Core cross-platform development":


    ![](img/install_option.jpeg){ width=80% }

#. Enter the product key you obtained previously, following [the instructions in the documentation](https://docs.microsoft.com/en-us/visualstudio/ide/how-to-unlock-visual-studio?view=vs-2019).
Normally, clicking on "View key" on the screen pictured in the fourth step above should give you access to a key, that you simply need to copy-and-paste in the menu you can access on Visual Studio by clicking on "Select File" → "Account Settings" → "License with a Product Key".

<!--
#. Configure the software as we did in ["Configuring Your Installation"](#configuring-your-installation).
-->

### For Mac and Other Linux Systems

You can either install another version of Visual Studio or "emulate" Windows on your computer.

For the first option, download a version of Visual Studio at <https://visualstudio.microsoft.com/vs/mac/>. It differs a bit from the Windows version, but that should not impact your experience in this class. The only Visual Studio feature we rely on is the ability to create "Console Apps with C#", which is equally available in both the Windows and Mac versions.

<!--
#. D

#. Configure the software as we did in ["Configuring Your Installation"](#configuring-your-installation).
-->

For the second option, you will need a [Virtual Machine](https://en.wikipedia.org/wiki/Virtual_machine) manager.
This option works for Linux systems as well.


#. You can use 
    #. "VMware Fusion 10.x Pro" (only for MacOS, available on [OnTheHub](https://e5.onthehub.com/WebStore/OfferingDetails.aspx?o=637dd37b-06b5-e711-80f7-000d3af41938&pmv=00000000-0000-0000-0000-000000000000&ws=2020165a-723a-de11-b696-0030485a8df0&vsro=8),
    #. [Virtual Box](https://www.virtualbox.org/) (for Linux and Mac),
    #. [Virtual Machine Manager](https://virt-manager.org/) (for Linux).
#. Download a version of "Microsoft Operating Systems" from [Azure Dev Tools for Teaching](https://aka.ms/devtoolsforteaching),
#. Install and run your version of Windows from your virtual machine, and follow [the instructions for windows](#install-win) to install Visual Studio.

<!-- Go to [Dr. Schultz's webpage](http://spots.augusta.edu/tschultz/resources/SWAvailable.html). Read the content of the page and click on the additional instructions if needed.  -->
<!--
#. 
Normally, you should have received a log-in for [OnTheHub](https://e5.onthehub.com/WebStore/ProductsByMajorVersionList.aspx?cmi_mnuMain=4751da70-dd3c-df11-b4ab-0030487d8897&ws=2020165a-723a-de11-b696-0030485a8df0&vsro=8) and should be able to download ressources from them.
You can find some instructions on [Dr. Schultz's webpage](http://spots.augusta.edu/tschultz/resources/SWAvailable.html).
#. If you're not running Windows,  there are two ways to proceed. You can jump to the next step if you're running Windows.
   
#. Download and install Visual Studio, leaving all the options on their default setting, but check the box next to "Workload" → "Windows" → ".NET-Desktop Development".
#. Configure the software as we did in ["Configuring Your Installation"](#configuring-your-installation).

-->

<!--
#. [Compare](https://www.visualstudio.com/vs/compare/?rr=) the professional and enterprise editions of Visual Studio.
#. Download "Visual Studio 2017 (v15.5) Enterprise Web installer (exe)" (or the "Professional" edition).
-->
<!-- #. Get the key for your software, by clicking on `Get VS 2017 Key` and entering your credentials for your Augusta account. -->



## Accessing One of the Computers in a Computer Lab

Please refer to [this page from AU's Information Technology](https://www.augusta.edu/its/computers-printing.php) to know where the computer labs are located.
Visual Studio should be pre-installed on every computer.

## Compiling Code On-Line

_As a backup or only to test snippets of code_, you can compile C# code online.
Multiple online platforms exist, such as:

- <https://rextester.com/>
- <https://www.tutorialspoint.com/compile_csharp_online.php>
- <https://www.onlinegdb.com/online_csharp_compiler>
- <https://www.jdoodle.com/compile-c-sharp-online/>
- <https://dotnetfiddle.net/>

Note that none of them are endorsed by the school and that they can pose security and privacy challenges: never enter any sensitive information and do not rely on them too heavily.
However, they can be a good support if you'd like to test a short snippet of code but don't have access at the moment to a computer with Visual Studio installed.
