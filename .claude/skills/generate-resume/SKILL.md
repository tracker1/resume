---
name: generate-resume
description: Generate a tailored or generic resume and cover letter into dist/, then build docx and pdf. Use when the user asks for a new resume, a cover letter, or documents for a specific job posting. Pass a job description or company name as the argument to tailor; with no argument, produces generic Staff/Principal-level documents.
---

# Resume and cover letter generation

Generate `dist/mryan-resume-YYYYMMDD.md` and `dist/mryan-cover-YYYYMMDD.md`, then render
both to `.docx` and `.pdf`.

If arguments were supplied, treat them as the target job (a posting, a company name, or a
role description) and tailor accordingly. With no arguments, produce generic documents
aimed at Staff, Principal, or Lead roles.

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
  itself a tell. Spell out contractions in the cover letter.
- **Positioning.** Michael is targeting Staff, Principal, or Lead roles. Lead with level
  and technical direction, not with years served.

## Length and structure

- **Resume:** roughly 1,650 to 1,750 words renders to 3 pages with the current LaTeX
  header. Three pages is acceptable and expected, given a long career with many shorter
  contracts.
- **Cover letter:** one page, 620 to 680 words of body. Do not exceed one page.
- Resume sections that work: Summary, Core Skills, Professional Experience (roughly ten
  roles in detail), Earlier Experience (condensed, 2003-2016), Independent Projects and
  Open Source.

## Markdown conventions the build depends on

`build-docs.sh` renders with `markdown+hard_line_breaks`, so **every paragraph and every
bullet must be a single line in the source file.** A wrapped paragraph renders with hard
breaks mid-sentence. The contact block at the top is the deliberate exception, since it
relies on those breaks.

## Steps

1. Read `about-me.md` (Section 8 especially) and the expanded resume.
2. If a job was named, identify what it actually screens for and which of Michael's
   evidence maps to it. Say so briefly before writing.
3. **Clear `dist/` first.** `dist/` holds only the current pair of documents, never a
   history of them. Remove its contents before generating: `rm -f dist/*`. Previous
   versions live in git, so nothing is lost. Create the directory if it does not exist.
4. Write both markdown files into `dist/` using today's date from `date +%Y%m%d`:
   - `dist/mryan-resume-YYYYMMDD.md`
   - `dist/mryan-cover-YYYYMMDD.md`
5. Build: `./build-docs.sh dist/mryan-resume-YYYYMMDD.md dist/mryan-cover-YYYYMMDD.md`
6. Verify: page counts via `pdfinfo`, `0` non-ASCII in both markdown files, and render at
   least one page to PNG with `pdftoppm` and actually look at it. Page count alone does not
   catch broken paragraph flow.
7. **Update `README.md`.** Replace everything between the `<!-- CURRENT:START -->` and
   `<!-- CURRENT:END -->` markers with links to the files just generated, keeping the
   existing shape:

   ```markdown
   **Resume** - [PDF](dist/mryan-resume-YYYYMMDD.pdf) | [DOCX](dist/mryan-resume-YYYYMMDD.docx) | [Markdown](dist/mryan-resume-YYYYMMDD.md)

   **Cover letter** - [PDF](dist/mryan-cover-YYYYMMDD.pdf) | [DOCX](dist/mryan-cover-YYYYMMDD.docx) | [Markdown](dist/mryan-cover-YYYYMMDD.md)

   *Generated YYYY-MM-DD.*
   ```

   Leave the markers themselves in place; they are how the next run finds the block. Do not
   edit any other part of the README. Afterwards, confirm no link points at a file that is
   no longer in `dist/`.
8. Report page counts, word counts, and any claim you could not source, so Michael can
   confirm or cut it.

## Tailoring, when a job is given

Keep every hard rule above. Then:

- Reorder and reweight rather than inventing. The evidence is fixed; the emphasis is not.
- Name the gap rather than hiding it. His recent contracts read C#/.NET heavy; if the role
  is TypeScript-first, address that directly and point at the TypeScript work that exists.
- Cover letter opening must be specific to the company. A letter that would work for any
  employer is worse than no letter.
- Do not restate the resume in the cover letter. The letter carries reasoning; the resume
  carries record.
