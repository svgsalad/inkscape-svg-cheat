<h1 align="center">Contributing guidelines</h1>

:tada: Welcome! :tada:

We appreciate your contributions a lot, so thanks for taking the time!

We do not wish to put any pressure on you, but we expect contributors to follow
the guidelines outlined in this document, so please, before submitting your
contribution or thinking about contributing, take a few minutes to read this
document first. It's not too long, so don't worry.

Table of Content
----------------

1. [Whose contributions should these guidelines have effects on?][effect]
2. [How you can contribute to this project][how-contrib]
    - [Reporting something that is wrong][report]
    - [Fixing the errors][fix]
    - [Suggesting][suggest]
    - [Submitting a new cheat sheet][submit]
3. [Submitting SVGs][svg-guides]
4. [Directory structure][dir]
5. [Thank you!][thank]

<!-- Headers -->
[effect]: #whose-contributions-should-these-guidelines-have-effects-on
[how-contrib]: #how-you-can-contribute-to-this-project
[report]: #reporting-something-that-is-wrong
[fix]: #fixing-the-errors
[suggest]: #suggesting
[submit]: #submitting-a-new-cheat-sheet
[svg-guides]: #submitting-svgs
[dir]: #directory-structure
[thank]: #tada-thank-you-tada

Whose contributions should these guidelines have effects on?
------------------------------------------------------------

These guidelines should be followed by outside collaborators (e.g. those who are
not members of SVG Salad). Members within the SVG Salad organization are already
assumed to have known and strictly follow these guidelines. In addition, SVG
Salad members are trusted and granted access to directly make Git commits to the
repository, so if they want to contribute to the project, it's likely that they
will do it by making commits directly to the repository instead of opening a new
issue, making a new pull request, or sending an e-mail as suggested for outside
collaborators throughout this document (you'll see below). SVG Salad members may
discuss with other SVG Salad members before making contributions, whether in a
GitHub issue or on any chat platform, but that's a different story.

How you can contribute to this project
--------------------------------------

There are several different ways to contribute:

- If you see something wrong: Either [report it][report] or [fix it][fix]
- If you have a suggestion (for a new cheat sheet or an improvement on
anything): [Tell us about it][suggest]
- If you've created a new cheat sheet and wish to submit it to this repository:
[**Do it**][submit]

### Reporting something that is wrong

If you see anything wrong with anything in the repository, please do tell us
about it. Things that might go faulty are:
- The content of the cheat sheets (Are they 100% correct? Maybe outdated?)
- The language used in the documents (grammar errors, structural errors, syntax
errors,...)
- The SVGs (Are the values correctly set? Is there something wrong with the
metadata?)
- The content of the documents
- ...and more

There are 2 ways to report:
- [Open a new issue][o-issh] (this is preferred)
- [Send an e-mail report][mail] (if you don't have and don't want to create a
GitHub account)

If you are able to fix the error(s), it is very much appreciated if you spend a
bit of your time to do that and submit your fix. See the subsection "Fixing the
errors" below.

### Fixing the errors

If you see an error, you can fix it and submit the fixed result. Possible errors
are listed in the prior subsection.

There are 2 ways to submit:
- Clone the repository, fix the error, and open a pull request
- [Send an e-mail][mail]

> **Note**: If your submission includes SVGs, please make sure that they follow
the guidelines for SVGs (see section ["Submitting SVGs"][svg-guides]).

### Suggesting

If you want to suggest a new cheat sheet or an improvement, we'd love to hear
from you. Here are several things that can be suggested:
- A new cheat sheet
- The content layout of a document (Use tables instead of lists? Use blockquotes
instead of paragraphs?)
- The content layout of a cheat sheet
- Better guidelines
- A different badge in the README :wink:
- ...and more

There are 2 ways to let us know your suggestion:
- [Open a new issue][o-issh] (this is preferred)
- [Send an e-mail][mail]

### Submitting a new cheat sheet

If you've created a new cheat sheet and wish to add it to this repository, you
can do so by doing one of the following:
- Opening a pull request (before that, you have to fork the repository and add
your own cheat sheet to the fork)
- [Sending an e-mail][mail] with your cheat sheet attached

If you choose to do the former, please make sure that the file(s) you've added
is/are located correctly according to the
[directory structure][dir].

Please send your cheat sheet in 3 formats (if possible): SVG, PNG, and PDF.
Otherwise, send it in SVG format. If your submission contains no SVG(s), you
will be requested to submit the cheat sheet again, but in SVG format.

Exporting PNGs and PDFs from SVGs isn't a hard task. Every modern vector
graphics (drawing) tool should be able to do this. For example, Inkscape can
export PNG and PDF from an SVG with the `--export-png` and the `--export-pdf`
command line options, respectively.

So please, take the time to export if you can.

Your cheat sheet, as an SVG file, must comply with the guidelines for SVGs. See
section ["Submitting SVGs"][svg-guides] below.

Submitting SVGs
---------------

If you submit an SVG to us, please make sure that it is...

1. ...syntactically correct
2. ...plain SVG (that means it shall not contain any namespace attributed to any
vector graphics tool e.g. Inkscape namespaces)
3. ...contains the following metadata: title, author's name, contributors' names
(if any), license name<sup>[1]</sup>
4. ...contains no malicious script
5. ...non-proprietary<sup>[2]</sup>

> **\[1\]**: In addition, include the following metadata if possible:
description and a link to the license.

> **\[2\]**: A Creative Commons license is preferred.

If you submit an SVG that you've taken from the repository and edited, you have
to, in addition, do the following:

1. Keep the original license: Do not license the new SVG under a different
license (at least without the permission of the original author)
2. Add your name to the "Contributors" metadata

Directory structure
-------------------

- `src/`: Contains SVG source of the cheat sheets
- `png/`: Contains exported PNGs of the cheat sheets
- `pdf/`: Contains exported PDFs of the cheat sheets
- `LICENSE`: A copy of the Creative Commons Zero v1.0 Universal <sup>(\*)</sup>
- `README.md`: Overview information for this repository
- `CONTRIBUTING.md`: Contribution guidelines for this repository
<sup>(\*\*)</sup>

> (\*): The file stays there as long as all cheat sheets presented in the
repository are CC0-licensed. If there is a presence of a non-CC0-licensed cheat
sheet, a directory named "`LICENSES`" will be created and the CC0 copy will be
placed in that directory along with other licenses of the cheat sheets.

> (\*\*): The document that you're reading.

:tada: Thank you! :tada:
========================

You just have read the whole contribution guidelines for this project! Thanks
for taking the time, we appreciate it a lot. If you want to propose changes to
this document, please do, we'd love to hear from you. Otherwise, we welcome your
contributions, so please don't hesitate to reach out.

<!-- LINKS -->
[o-issh]: https://github.com/svgsalad/inkscape-svg-cheat/issues/new
[mail]: mailto:you_create@protonmail.com
