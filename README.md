# Introduction

This [XSLT](http://www.w3schools.com/xsl/) template is useful if you are
working on transcriptions of speech recordings in the `.eaf` format used by the
[ELAN](https://tla.mpi.nl/tools/tla-tools/elan/) transcription software and
would like to share a simple preview of the transcription with others without
the need for them to install ELAN. It takes an `.eaf` transcription and renders
it in the browser in a format similar to that of ELAN's *Annotation Mode*.

More accurately, what happens is that every `TIER` whose `LINGUISTIC_TYPE`'s
attribute `TIME_ALIGNABLE` is set to `"true"` is rendered as a separate layer
of annotations. If there are any dependent tiers (i.e.
`TIME_ALIGNABLE="false"`), their annotations are merged into the corresponding
annotations on their parent tier (`TIME_ALIGNABLE="true"`).

# Usage / Quickstart

1. Change the extension of your `.eaf` transcription to `.xml` (e.g. `foo.eaf`
→ `foo.xml`).

2. Open the transcription in a text editor and add the following as the
**second line from the top**:

```xml
<?xml-stylesheet type="text/xsl" href="eaf.xsl"?>
```

3. Put the transcription in the same directory as the `eaf.xsl` stylesheet and
its helper files reside.

4. (OPTIONAL) Put the sound file for the transcription somewhere it can be
reached from the stylesheet's directory and set the `RELATIVE_MEDIA_URL` in the
transcription file accordingly; this will allow you to play sound.

    (Please note that a mime-type of `audio/wav` is currently hardcoded in the
    stylesheet, but can easily be changed. As of this writing, this mime-type
    is supported in `<audio/>` tags by all major browsers except for Internet
    Explorer, which only supports `audio/mp3`.)

5. Now you can either open the file locally in a browser (drag and drop) or
have it served by a webserver (which is generally what you want when your goal
is to share the transcription with someone else). In the latter case, some
Javascript will be additionally loaded which will slightly improve the
usability and allow users to jump around in the sound recording by clicking on
the individual annotations.

    (Please note that your server has to be properly configured in order to
    allow these jumps in the sound file; simple development servers that you
    might run locally, like `python -m SimpleHTTPServer`, mostly aren't, at
    least not out of the box.)

# TODO / Limitations

- the styling is ugly and not very flexible (absolute positioning, fixed widths
and heights, text overflowing divs etc.) →  fix that.

- add stylesheets for different types of views? (e.g. ~ ELAN's *Transcription
Mode*)
