This project is deprecated and unmaintained. Proceed with caution!

BMI Calculator
==============

Storyboard
----------
While this is technically a Universal app, all storyboard-ing was done for the
iPhone.

Coding style
------------
- There are no custom objects being used.

- Everything is handled inside the ViewController.

- There are no tests.

Graphics
--------
I created a set of images of a pizza with various numbers of slices missing. The
smaller your BMI, the more slices are shown.

Challenges
----------
- Using the Xcode editor. Not the extra parts like the debugger + refactoring
  tools, but the actual editor is slow and a pain to use compared to vim.

- Converting between units is a lot more painful than I remember it being.

- Exporting and creating the images probably took ~50% of the time.

- The interface builder is a lot less transparent than I'm comfortable with.
  I renamed an IBOutlet method in my ViewController and the app refused to
  work due to a NSSomethingSomethingKey exception. That's expected, but the
  message wasn't particularly useful and took much Googling to figure out.

License
-------
BSD, see the LICENSE file.
