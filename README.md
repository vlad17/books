# Books

A collection of book notes.

* [Book of Why](book-of-why/)

# Contributing

**To create all PDFs**, run `bash build.sh` in the repo root. This currently installs `pdflatex` and related resources for compilation.

**To add a new book**, add a folder and a link in this `README.md` to the above list. Feel free to use the `defs.tex`
for some pre-built math macros.

Within a book's README folder, feel free to structure the notes however you'd like, but provide a linked-up table of contents in that folder's `README.md`:

```{markdown}
# BOOK NAME notes

Primary source authors: BOOK AUTHOR 1, BOOK AUTHOR 2.

Links to notes

#. [Chapter 1](chapter1.pdf)
#. [Chapter 2](chapter2.pdf)
```

Put *your* name directly in the linked notes document (to see who contributed the notes).

**Notes on notes**. Distill, distill, distill! These notes are maximally useful when they find an optimum between two conflicting goals.

#. They can be revisited to quickly summarize or identify a key point (which can then be manually back-referenced with the original source). _Essential_ for this is to use terse language, 
#. They unravel difficult-to-understand topics that are obscure in the reference.

More concretely:

* Pictures of pen-and-paper drawings
* Formulas over paragraphs
* Avoid straying too far from the material, or do so in a separate section.

### Contributors

* [Vlad Feinberg](https://github.com/vlad17)
* [Josh Bollar](https://github.com/JoshBollar)
