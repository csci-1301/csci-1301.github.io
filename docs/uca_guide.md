---
title: UCA starting guide
---

Congratulations on your new position!
This page briefly explain what is expected from you as an Undergraduate Course Assistant (UCA).

# The Three Rules

There are three important rules for you:

#. This is a job.
    ~ Meaning that you have a contract that you should have read and understood, and that you need to carefully clock in and out to receive the pay you deserve.
    Briefly reviewing the information [listed here](https://www.augusta.edu/hr/university/university_benefits/studenthires.php), and in particular [those slides](https://www.augusta.edu/hr/university/university_benefits/documents/department_guide_studenthireprocess_fy_23.pdf) can help you in making sure that you understand all aspects of your position.
    Do not forget that you are first and foremost a _student_, and that your main goal here is to _graduate_.
    
#. You are here to help students.
    ~ Please, review what you should and should not do [on this section](uca.html#what-is-an-undergraduate-course-assistant-1).
    It is difficult to strike the right balance when helping a student, but a good rule of thumb is that _you should not *do* anything yourself, just explain and give hints so that *they* can solve the problem they are facing_. You are here to help students understand how to solve a problem, not to solve it for them.
    
#. Don't hesitate to ask.
    ~ That's it. You are not alone to deal with difficult situations (cheating, rude behavior, student abusing your time, etc.), and it is normal if you are sometimes unsure of the best course of action. The instructors are happy to train you and help you solve problems that may arise.

Once you have done the paperwork (contract, background request form, …) with our Academic Program Coordinator, Wennie Squires, you can start working and clock-in on [augusta.edu/oneusg](https://www.augusta.edu/oneusg/).
Please, be on the lookout for monthly "Time Reporting Reminders for Student Assistants" emails from Wennie, that contains important information and reminders.
Any question about human resource, pay, hour caps and the like should be directed to our Academic Program Coordinator.

Once this is done, your first task is to get in touch with your instructor, if they have not already done it, to know what they expect from you. 
You can discuss topics such as the need for (virtual or physical) office hours, whenever you need to seat in class, how to help students, etc.

On top of supporting students and helping the instructor, you are also encouraged to work up to 4 hours per week on the improvement of those resources.
Your contribution may range from spell-checking to pointing inconsistencies, from clarifying statements to re-organizing exercises.
Thanks to git and [pull requests](https://github.com/csci-1301/csci-1301.github.io/pulls), you do not need to worry (too much) about introducing mistakes or blunders: the changes you suggest will always be reviewed by instructors before being merged in our master document.

# Editing the Resources

You need three things to start editing our resources:

- A github account & an invitation,
- Some working knowledge of markdown,
- Some working knowledge of github's interface.

Follow the instructions in our ["Contributing Guidelines"](contributing.html#if-you-are-a-uca) for the first step.

For a quick syntax guide in Markdown, the best resource is [this website](https://commonmark.org/help/) and its [10 minutes tutorial](https://commonmark.org/help/tutorial/).
We list some [best practices](user_guide.html#editing-resources-1), and would appreciate if you could follow them.

For github's interface, please refer to the following guide:

!["Navigating repositories"](img/uca_guide1.jpg) 

GitHub is separated into many "repositories". The **csci-1301.github.io** contains most of the resources that will be used (so it will be where you will navigate to the most), while the **feedback-fall-2021** and similarly named repositories contains feedback submitted by students/users. 

!["Navigating folders"](img/uca_guide2.jpg) 

Under the **Code** section (next to Issues, Pull Requests, Actions, etc.), you will find various folders containing documents for the website. Typically, if there is some error or mistake in the lecture notes, so that will be where you will navigate to the most. 
The way the resources are organized [is explained here](user_guide.html#resources-organization-1).

!["Navigating documents"](img/uca_guide3.jpg)

For this example, I just clicked on the first chapter, "General Concepts".

!["Editing Mode"](img/uca_guide4.jpg) 

On this page, you can see the edit history of that specific document you clicked on. In the corner above the document and below the edit history, there is a pencil icon that will put you into editing mode for that document.

!["Editing vs Previewing"](img/uca_guide5.jpg) 

On this page, you will see the document formatted as markdown with two sections at the top of the document: *Edit file* and *Preview*. If you have *Edit file* selected, then you will see the "code" version of the document whereas if you click on the *Preview* button, you will see the document in its "final" form, or how the website users should see it, without the "code". To edit, make sure you have *Edit file* selected. 


!["Committing"](img/uca_guide6.jpg) 

Once you have made the edits you wanted, you need to "commit" them; just like how you may write a paper, you need to submit it to the professor for them to see it. At the bottom of the page, there is a header box and a description box for you to describe what you did so others will know the changes you did (you do not need to go into *every* detail; just describe it generally, like "I fixed grammatical issues" or "Fixed code error"). There is also two buttons: **Commit directly to `main` branch** and **Create a new branch for this commit and start a pull request**. 

- **Commit directly to `main` branch** submits your edits directly into the document.

- **Create a new branch for this commit and start a pull request** creates a "pull request" (which can be found [in the *Pull Requests* tab at the top of the page](https://github.com/csci-1301/csci-1301.github.io/pulls)) which essentially notifies others "you edited this document and you want them to check it". Others can check the changes you make, improve them, change them, and can submit them for you. 

As a UCA, you only have the rights to **Create a new branch for this commit and start a pull request** so others can double check your edits: it is a safety net, as we will be able to catch any mistake you may have introduced!
