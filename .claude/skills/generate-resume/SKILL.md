---
name: generate-resume
description: Generate a tailored or generic resume into dist/, then build docx and pdf. Use when the user asks for a new resume or an updated current resume. Pass a job description or company name as the argument to tailor; with no argument, produces a generic Staff/Principal-level resume. Cover letters are not produced here; use generate-target for a job-specific resume and cover letter pair.
---

# Resume generation

Generate `dist/mryan-resume-YYYYMMDD.md`, then render it to `.docx` and `.pdf`.

**This skill produces a resume only.** `dist/` carries the current resume and nothing else.
Cover letters are written per application by the `generate-target` skill, into that
application's own folder under `temp/`. If Michael asks for a cover letter here, point him
at `generate-target` rather than writing one into `dist/`.

If arguments were supplied, treat them as the target job (a posting, a company name, or a
role description) and tailor accordingly. With no arguments, produce a generic resume aimed
at Staff, Principal, or Lead roles.

## Sources of truth

Read these before writing anything. Do not invent facts that are not in them.

1. `about-me.md` - engineering temperament, working style, and **Section 8: Generation
   Guidelines**, which is binding. Read Section 8 in full every time.
2. `Michael J. Ryan - Resume - Expanded.md` - the master record of every role, project,
   and technology. Detail here is reference-grade and deliberately exceeds what any
   generated document should carry.

If a detail you want is in none of these, ask Michael. Do not write it as a sentence and
hope.

## Hard rules

These come from `about-me.md` Section 8. Re-read it; this is a summary, not a replacement.

- **ASCII only.** No em dashes, no en dashes, no smart quotes, no curly apostrophes.
  Verify with `LC_ALL=C grep -c '[^ -~\t]' <file>` and expect `0`.
- **No version numbers.** The master resume records them; generated documents name the
  technology only. The one exception is where a version is the point, such as the .NET
  Core 2 to 3 migration at Runbeck.
- **No volatile metrics.** No counts of NPM packages, StackOverflow score or answers, or
  GitHub repositories and stars. "Long-standing top-ranked contributor" is enough.
- **Experience framing.** "Close to 30 years." Per-language tenure comes from start years:
  JavaScript 1997, SQL 1999, C# 2001, Node.js 2011, React 2013, TypeScript 2013, Rust 2023
  (personal projects). Compute counts against the current date; do not copy stale numbers.
- **Do not claim.** No architecture ownership at ServiceTitan; his scope was the API
  surface, its design and implementation. The ServiceTitan API's consumers were external
  integrators, not internal product teams. He built _on top of_ First American's micro-UI
  platform library and did not build or contribute to it.
- **No AI tells.** No em dashes, no "not just X but Y", no leverage/robust/seamless/
  passionate/spearheaded/delve/elevate. Vary sentence and bullet length; uniform rhythm is
  itself a tell.
- **Positioning.** Michael is targeting Staff, Principal, or Lead roles. Lead with level
  and technical direction, not with years served.

## Length and structure

- Roughly 1,650 to 1,750 words renders to 3 pages with the current LaTeX header. Three
  pages is acceptable and expected, given a long career with many shorter contracts.
- Sections that work: Summary, Core Skills, Professional Experience (roughly ten roles in
  detail), Earlier Experience (condensed, 2003-2016), Independent Projects and Open Source.

## Markdown conventions the build depends on

`build-docs.sh` renders with `markdown+hard_line_breaks`, so **every paragraph and every
bullet must be a single line in the source file.** A wrapped paragraph renders with hard
breaks mid-sentence. The contact block at the top is the deliberate exception, since it
relies on those breaks.

## Steps

1. Read `about-me.md` (Section 8 especially) and the expanded resume.
2. If a job was named, identify what it actually screens for and which of Michael's
   evidence maps to it. Say so briefly before writing.
3. **Clear `dist/` first.** `dist/` holds only the current resume, never a history of
   versions and never a cover letter. Remove its contents before generating:
   `rm -f dist/*`. Previous versions live in git, so nothing is lost. Create the directory
   if it does not exist.
4. Write `dist/mryan-resume-YYYYMMDD.md`, using today's date from `date +%Y%m%d`.
5. Build: `./build-docs.sh dist/mryan-resume-YYYYMMDD.md`
6. Verify: page count via `pdfinfo`, `0` non-ASCII in the markdown, and render at least one
   page to PNG with `pdftoppm` and actually look at it. Page count alone does not catch
   broken paragraph flow.
7. **Update `README.md`.** Replace everything between the `<!-- CURRENT:START -->` and
   `<!-- CURRENT:END -->` markers with links to the file just generated, keeping the
   existing shape:

   ```markdown
   **Resume** - [PDF](https://github.com/tracker1/resume/raw/master/dist/mryan-resume-YYYYMMDD.pdf) | [DOCX](https://github.com/tracker1/resume/raw/master/dist/mryan-resume-YYYYMMDD.docx) | [Markdown](dist/mryan-resume-YYYYMMDD.md)

   _Generated YYYY-MM-DD. PDF and DOCX links download directly; Markdown renders on GitHub._
   ```

   **Use absolute `raw` URLs for the PDF and DOCX**, in the form
   `https://github.com/tracker1/resume/raw/master/dist/<file>`. A relative link to a binary
   only opens the GitHub file-view page, and for LFS-backed files `raw.githubusercontent.com`
   serves the pointer text rather than the document. The `github.com/.../raw/...` form
   redirects to GitHub's media host and returns the real file. Markdown keeps a relative
   link so GitHub renders it.

   These URLs describe where the files will live once pushed to `master`, so they are
   correct in the committed README even before the push.

   Leave the markers themselves in place; they are how the next run finds the block. Do not
   edit any other part of the README. Afterwards, confirm no link points at a file that is
   no longer in `dist/`.
8. Report page count, word count, and any claim you could not source, so Michael can
   confirm or cut it.

## Tailoring, when a job is given

Keep every hard rule above. Then:

- Reorder and reweight rather than inventing. The evidence is fixed; the emphasis is not.
- Name the gap rather than hiding it. His recent contracts read C#/.NET heavy; if the role
  is TypeScript-first, lead with the TypeScript work that exists rather than burying it.
- A tailored resume written here still replaces the one in `dist/`. If the tailoring is
  specific enough that Michael will want the generic version back afterwards, say so, and
  suggest `generate-target` with a `temp/<company>/job.txt` folder instead, which keeps
  `dist/` generic and produces a matching cover letter.
