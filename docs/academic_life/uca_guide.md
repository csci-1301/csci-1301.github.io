---
date: 2024-05-25
default-code-class: csharp
title: UCA starting guide
---

Congratulations on your new position! This page briefly explain what is
expected from you as an Undergraduate Course Assistant (UCA).

# The Three Rules

There are three important rules for you:

1.  This is a job.  
    Meaning that you have a contract that you should have read and
    understood, and that you need to carefully clock in and out to
    receive the pay you deserve. Briefly reviewing the information
    [listed
    here](https://www.augusta.edu/hr/university/university_benefits/studenthires.php),
    and in particular [those
    slides](https://www.augusta.edu/hr/university/university_benefits/documents/department_guide_studenthireprocess_fy_23.pdf)
    can help you in making sure that you understand all aspects of your
    position. Do not forget that you are first and foremost a *student*,
    and that your main goal here is to *graduate*.

2.  You are here to help students, not to solve their problems.  
    Please, review what you should and should not do [on this
    section](ca.html#what-is-an-undergraduate-course-assistant). It is
    difficult to strike the right balance when helping a student, but a
    good rule of thumb is that you should not do anything yourself, just
    explain and give hints so that they can solve the problem they are
    facing. You are here to help students understand how to solve a
    problem, not to solve it for them.

3.  Don’t hesitate to ask.  
    That’s it. You are not alone to deal with difficult situations
    (cheating, rude behavior, student abusing your time, etc.), and it
    is normal if you are sometimes unsure of the best course of action.
    The instructors are happy to train you and help you solve problems
    that may arise.

In general, UCAs should prioritize giving clear and concise explanations
and hints, as to avoid confusion while also helping them better
understand the problem-solving process. This means that when you
encounter a problem that you are not able to solve, it’s important to
ask a colleague who is available for help and try to understand their
approach. This way, the student can receive assistance more quickly and
will be less likely to get confused during the troubleshooting process.
By emphasizing the importance of understanding and working through the
problem, rather than just providing a solution, tutors can help students
develop the skills they need to become more independent problem-solvers.

On top of supporting students and helping the instructor, you are also
encouraged to work on the improvement of those resources. Your
contribution may range from spell-checking to pointing inconsistencies,
from clarifying statements to re-organizing exercises. Thanks to git and
[pull requests](https://github.com/csci-1301/csci-1301.github.io/pulls),
you do not need to worry (too much) about introducing mistakes or
blunders: the changes you suggest will always be reviewed by instructors
before being merged in our master document. We discuss below how you can
edit our resources.

# Editing the Resources

You need three things to start editing our resources:

- A github account & an invitation,
- Some working knowledge of markdown,
- Some working knowledge of github’s interface.

Follow the instructions in our [“Contributing
Guidelines”](contributing.html#if-you-are-a-uca) for the first step.

For a quick syntax guide in Markdown, the best resource is [this
website](https://commonmark.org/help/) and its [10 minutes
tutorial](https://commonmark.org/help/tutorial/). We list some [best
practices](user_guide.html#editing-resources-1), and would appreciate if
you could follow them.

For github’s interface, please refer to the following guide:

<figure>
<img src="img/uca_guide1.jpg" alt="“Navigating repositories”" />
<figcaption aria-hidden="true">“Navigating repositories”</figcaption>
</figure>

GitHub is separated into many “repositories”:

- The **csci-1301.github.io** contains most of the resources that will
  be used (so it will be where you will navigate to the most),
- The **uca-resources-<semester>-YYYY** is a *private* repository where
  material useful to UCAs but not accessible to students (such as
  project solution, listings, etc.) will be shared,
- The **feedback-<semester>-YYYY** and similarly named repositories
  contains feedback submitted by students/users.

<figure>
<img src="img/uca_guide2.jpg" alt="“Navigating folders”" />
<figcaption aria-hidden="true">“Navigating folders”</figcaption>
</figure>

Under the **Code** section (next to Issues, Pull Requests, Actions,
etc.), you will find various folders containing documents for the
website. Typically, if there is some error or mistake in the lecture
notes, so that will be where you will navigate to the most. The way the
resources are organized [is explained
here](user_guide.html#resources-organization-1).

<figure>
<img src="img/uca_guide3.jpg" alt="“Navigating documents”" />
<figcaption aria-hidden="true">“Navigating documents”</figcaption>
</figure>

For this example, I just clicked on the first chapter, “General
Concepts”.

<figure>
<img src="img/uca_guide4.jpg" alt="“Editing Mode”" />
<figcaption aria-hidden="true">“Editing Mode”</figcaption>
</figure>

On this page, you can see the edit history of that specific document you
clicked on. In the corner above the document and below the edit history,
there is a pencil icon that will put you into editing mode for that
document.

<figure>
<img src="img/uca_guide_getting_help.png"
alt="“Editing vs Previewing”" />
<figcaption aria-hidden="true">“Editing vs Previewing”</figcaption>
</figure>

On this page, you will see the document formatted as markdown with two
sections at the top of the document: *Edit file* and *Preview*. If you
have *Edit file* selected, then you will see the “code” version of the
document whereas if you click on the *Preview* button, you will see the
document in its “final” form, or how the website users should see it,
without the “code”. To edit, make sure you have *Edit file* selected.

<figure>
<img src="img/uca_guide_getting_help_2.png" alt="“Proposing Changes”" />
<figcaption aria-hidden="true">“Proposing Changes”</figcaption>
</figure>

Once you have made the edits you wanted, you need to “commit” them; just
like how you may write a paper, you need to submit it to the professor
for them to see it. At the bottom of the page, there is a header box and
a description box for you to describe what you did so others will know
the changes you did (you do not need to go into *every* detail; just
describe it generally, like “I fixed grammatical issues” or “Fixed code
error”). As a UCA, you do not have write access to the
**csci-1301.github.io** repository, so submitting a change will write it
to a new branch in your fork `<your name>`/csci-1301.github.io, so you
can send a pull request. Given the new protocol by Github, after making
the neccessary edits, click the “Propose Changes” button located at the
bottom. On this page and the next, there will be a “Create pull request”
button, by clicking on this you will start a pull request. After you
have successfully created a new branch for your commit and started a
pull request, your edits will be checked by others so as to catch any
mistake(s) you may have introduced before your pull request is merged
into the base branch.

<figure>
<img src="img/uca_guide6.jpg" alt="“Committing”" />
<figcaption aria-hidden="true">“Committing”</figcaption>
</figure>

Note that if you are making edits inside the repository for UCAs,
`uca-resources-<semester>-YYYY`, you do have write access so there will
instead be two buttons: **Commit directly to `main` branch** and
**Create a new branch for this commit and start a pull request**

- **Commit directly to `main` branch** submits your edits directly into
  the document.

- **Create a new branch for this commit and start a pull request**
  creates a “pull request” (which can be found [in the *Pull Requests*
  tab at the top of the
  page](https://github.com/csci-1301/csci-1301.github.io/pulls)) which
  essentially notifies others “you edited this document and you want
  them to check it”. Others can check the changes you make, improve
  them, change them, and can submit them for you.

You can **Create a new branch for this commit and start a pull request**
so others can double check your edits: it can act as a safety net, so
your colleagues will be able to catch any mistake(s) you may have
introduced!
