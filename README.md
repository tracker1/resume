# Michael J. Ryan - Resume

## Current

<!-- CURRENT:START -->
**Resume** - [PDF](dist/mjryan-resume-20260911.pdf) | [DOCX](dist/mjryan-resume-20260911.docx) | [Markdown](dist/mjryan-resume-20260911.md)

**Cover letter** - [PDF](dist/mryan-cover-20260911.pdf) | [DOCX](dist/mryan-cover-20260911.docx) | [Markdown](dist/mryan-cover-20260911.md)

*Generated 2026-09-11.*
<!-- CURRENT:END -->

---

## What this is

The working repository behind my resume. It holds one detailed source of record and a set
of generated, audience-specific documents produced from it, rather than a pile of
hand-edited Word files that drift apart over time.

Phoenix, AZ, USA | Remote
resume@tracker1.dev | [tracker1.dev](https://tracker1.dev) | [LinkedIn](https://www.linkedin.com/in/tracker1) | [GitHub](https://github.com/tracker1)

## Layout

| Path | What it is |
| --- | --- |
| `Michael J. Ryan - Resume - Expanded.md` | The master record. Every role, project and technology, in more detail than any resume should carry, including version numbers kept purely for reference. |
| `about-me.md` | Engineering temperament, design philosophy and working patterns, plus Section 8, the generation rules that every produced document must follow. |
| `Michael J. Ryan - Work History.txt` | Employer, title and date cross-check. |
| `dist/` | The current generic resume and cover letter, in Markdown, DOCX and PDF. |
| `temp/` | Per-application working folders, one per job posting. Gitignored. |
| `build-docs.sh` | Renders Markdown to DOCX and PDF. |
| `.pandoc/header.tex` | LaTeX styling for the PDF output: margins, spacing, heading treatment. |

## Generating documents

Two Claude Code skills drive this, both reading `about-me.md` and the expanded resume as
their only sources of truth:

- `/generate-resume` - clears `dist/`, writes a fresh generic resume and cover letter aimed
  at Staff, Principal or Lead roles, builds all three formats, and updates the links above.
  Pass a job description to tailor it instead.
- `/generate-target` - scans `temp/` for folders containing a `job.txt` posting and produces
  a tailored resume and cover letter in each, skipping any folder already generated.

To render Markdown by hand:

```bash
./build-docs.sh                      # everything in dist/, temp/ and temp/*/
./build-docs.sh path/to/file.md      # one file
```

## Requirements

```bash
sudo apt install -y pandoc texlive-xetex texlive-latex-recommended texlive-fonts-recommended
```

Pandoc handles DOCX natively; XeLaTeX renders the PDF.

## Fresh checkout

The DOCX and PDF files are stored with [Git LFS](https://git-lfs.com/). Install it before
cloning, or the binaries arrive as small text pointer files rather than real documents.

```bash
sudo apt install -y git-lfs    # or: brew install git-lfs
git lfs install                # once per machine, sets up the filters
git clone git@github.com:tracker1/resume.git
```

If the repository is already cloned and LFS was installed afterwards:

```bash
git lfs install
git lfs pull                   # fetch the binary contents from the remote
```

### When a PDF or DOCX will not open

Check whether the file is a pointer rather than a document:

```bash
head -c 40 dist/*.pdf
```

A real PDF starts with `%PDF`, and a DOCX starts with `PK`. If instead you see
`version https://git-lfs.github.com/spec/v1`, the LFS smudge filter did not run.

```bash
git check-attr filter -- dist/some-file.pdf   # expect: filter: lfs
```

If that reports `filter: unspecified`, something in `.gitattributes` is overriding the LFS
rules. Attributes are last-match-wins, so a broad pattern such as `* !filter` placed after
the LFS lines silently disables them for every file. Remove the offending line, then
materialize the real content:

```bash
git lfs checkout               # from objects already in .git/lfs/objects
git lfs pull                   # if the objects are not local yet
```
