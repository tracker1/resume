# Michael J. Ryan - Resume

Phoenix, AZ, USA | Remote
resume@tracker1.dev | [tracker1.dev](https://tracker1.dev) | [LinkedIn](https://www.linkedin.com/in/tracker1) | [GitHub](https://github.com/tracker1)

Working repository behind my resume. It holds one detailed source of record and a set
of generated, audience-specific documents produced from it, rather than a pile of
hand-edited Word files that drift apart over time.

## Current

<!-- CURRENT:START -->

**Resume** - [PDF](https://github.com/tracker1/resume/raw/master/dist/mryan-resume-20260914.pdf) | [DOCX](https://github.com/tracker1/resume/raw/master/dist/mryan-resume-20260914.docx) | [Markdown](dist/mryan-resume-20260914.md)

_Generated 2026-09-14. PDF and DOCX links download directly; Markdown renders on GitHub._

<!-- CURRENT:END -->

## Generating documents

Two Claude Code skills produce everything in `dist/` and `temp/`. Both read `about-me.md`
and `Michael J. Ryan - Resume - Expanded.md` as their only sources of truth, and both
follow the generation rules in Section 8 of `about-me.md`.

### `/generate-resume`

Writes the current general-purpose resume. It clears `dist/`, generates a fresh resume
aimed at Staff, Principal or Lead roles, renders it to DOCX and PDF, and rewrites the
Current links above to match. Resume only; `dist/` holds one document and no cover letter.

```
/generate-resume
/generate-resume Senior Platform Engineer at Example Corp
```

Passing a job or company tailors the emphasis. Note that a tailored run still replaces
what is in `dist/`, so for a specific application `/generate-target` is usually the better
choice.

### `/generate-target`

Writes a tailored resume and a cover letter for a specific posting. Create a folder under
`temp/` and paste the posting into `job.txt`:

```
temp/
  example-corp-platform/
    job.txt
```

Then run `/generate-target`. It processes every folder holding a `job.txt`, writes a
resume and cover letter into each, and renders both to DOCX and PDF alongside the source.
Folders that already contain generated documents are skipped rather than overwritten, so
the command is safe to re-run after adding a new posting.

`temp/` is gitignored. Anything generated there is outside version control and is not
recoverable once deleted.

For everything else - repository layout, rendering Markdown by hand, required packages,
and Git LFS setup for a fresh checkout - see [CONTRIBUTING.md](./CONTRIBUTING.md).

--

[ISC License](./LICENSE.md)
