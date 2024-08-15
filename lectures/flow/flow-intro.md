---
date: 2024-05-26
default-code-class: csharp
title: Introduction
---

Decisions are a constant occurence in daily life. For instance consider
an instructor teaching CSCI 1301. At the beginning of class the
instructor may

- Ask if there are questions. If a student has a question, then the
  instructor will answer it, and ask again (“Anything else?”).
- When there are no more questions, the instructor will move on to the
  next step.
- If there is a quiz scheduled, the next step will be distributing the
  quiz.
- If there is no quiz scheduled or the quiz is complete (and collected),
  the instructor may introduce the lecture topic (“Today, we will be
  discussing Decisions and Decision Structures”) and start the class.
- etc.

This type of “branching” between multiple choices can be represented
with an [activity
diagram](https://www.wikiwand.com/en/Activity_diagram):

<figure>
<img src="img/activity_diag_teaching"
alt="“An Activity Diagram on Teaching a Class”" />
<figcaption aria-hidden="true">“An Activity Diagram on Teaching a
Class”</figcaption>
</figure>

In C#, we will express

- repetitions (or “loops”) (“As long as there are questions…”) with the
  `while`, `do…while` and `for` keywords,
- branchings (“If there is a quiz…”) with the `if`, `if…else` and
  `switch` keywords.

Both structures need a datatype to express the result of a decision (“Is
it *true* that there are questions.”, or “Is it *false* that there is a
quiz.”) called booleans. Boolean values can be set with conditions, that
can be composed in different ways using three operators (“and”, “or” and
“not”). For example, “If today is a Monday or Wednesday, and it is not
past 10:10 am, the class will also include a brief reminder about the
upcoming exam.”
