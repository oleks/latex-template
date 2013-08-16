Copyright (c) 2013 Oleksandr Shturmov
Licensed under the MIT license. See ./latex/LICENSE for details.

My personal LaTeX template and survival pack.

# Template

The template package is intended to serve as a generic template for my written
work at the university. It imports some common packages, decides the fonts and
some general layout.

## Import

The template has two flavours, one that uses fancy headers and footers, and one
that does not. The latter is the default. To import the template package with
the fancy flavour, add the atom `fancy` as an option, i.e.

    \usepackage[fancy]{template}

## Setup

A series of commands are supplied for basic document setup, i.e. the work
title, author, due date, etc. The commands make sure to update the LaTeX
commands `\title`, `\author`, as well as set the fields `pdftitle` and
`pdfauthor` in a `\hypersetup` command.

    \setup{<keyvalues>}

General properties setup, except for the author.

<keyvalues>

[location] This is the university or other type of ``location''.

[subject] This is the subject for which this assignment is written.

[assignment] This is the name of the assignment; effectively becomes the
title of the document.

[date] The default functionality of the day's date being specified given \date
is not very useful. Usually, what you want to specify is the assignment due
date. The [date] specfier allows you to do just that. The default \date
functionality is also overriden so you don't make such a silly mistake.

\setup[<keyvalues>]{<author>}

<author> Is the long author specification which will show up with the document
title. It is also the default value for a short author specification, see
furhter under Keyvalues.

<keyvalues>

[short] This is the short author specification, overriding this value allows
you to specify a shorter author specification for the top left corner header,
in case the long author specification does not fit.

[addendum] More often then not an addendum is required for to the names of the
students involved like some sort of identification number. This specification
will show up in the top left corner of the header, just below the short/long
author specification.

# Survival pack

## References

The way references are styled is inspired by Accelerated C++, ISBN
0-201-70353-X. The idea is to both show the section/figure/table counter value
AND the page where to find the section/figure/table. This allows for the reader
to easier lookup the reference since the reader only has to look up the page
and then the section on the page rather then lookup the section through the
entire opus with only a rough idea of where to find the section/figure/table.

\referToSection{<label>}

Refer to labels section:<label>.


\referToFigure{<label>}

Refer to labels figure:<label>.


\referToTable{<label>}

Refer to labels tabel:<label>.


## Figures

\includeFigure[<options>]{<filename>}{<caption>}[<float>]

This command allows you to quickly import a figre using the regular
\includegraphics command from graphicx. The figure is pulled from the
``figures'' directory which is assumed to exist in the project root.

Arguments:

<options> You have a choice here, either specify a numeric value which will
default to the scale of the included graphic, or the entire options string for
\includegraphics, e.g. "width=\textwidth". Defaults to 1.

<filename> The graphic filename with/without extension. The figure's label is
thereafter deterministically set to "figure:filename".

<caption> The caption for the image. Commands are allowed in the caption.

<float> This argument to allows you to change the floating options of the figure.
Defaults to htbp!.

## Tables

\makeTable[<float>]{<label>}{<caption>}{<layout>}{<headers>}{<rows>}

A shortcut to making tables.

Arguments:

<float> The float specification for the surrounding table environment. Defaults
to htbp!.

<label> The label for the table, however the final label is prefixed by table:.

<caption> The caption for the table. The caption may contain commands.

<layout> The usual layout specification for the columns, e.g. |c|c|c|.

<headers> The headers of the table. By default the header row is separated with
a hard line. It is common for the headers to be bold, however there doesn't
seem to be a simple way to do this, yet. The columns should be separated by &,
as usual.

<rows> The rows of the table separated by \\ with the columns separated by &,
as usual.

## Math

See
[./latex/output/template.pdf](https://github.com/oleks/latex-template/blob/master/latex/output/template.pdf?raw=true
"template.pdf").

## Bibliography

I choose to do bibliography manually rather than using BibTeX as BibTeX styles
typically only define a layout for a certain subset of the possible entries.
This forces you to work around the entries, and around the styles if you want
to include information other than what the style supports. I find this
counterintuitive.

