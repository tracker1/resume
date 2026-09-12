---
name: generate-target
description: Scan temp/ for job application folders containing a job.txt posting, and generate a tailored resume and cover letter into each one, then build docx and pdf. Skips folders that already have generated documents. Use when the user has dropped one or more job descriptions into temp/ and wants targeted documents built for them.
---

# Targeted application generation

Each job application lives in its own folder under `temp/`, holding a `job.txt` with the
posting text pasted in:

```
temp/
  vanta-product-platform/
    job.txt
  some-other-company/
    job.txt
```

Generate a tailored resume and cover letter into each folder that needs them, then render
both to `.docx` and `.pdf` alongside the source.

## Before writing anything

Read `.claude/skills/generate-resume/SKILL.md` and follow its **Sources of truth**, **Hard
rules**, **Length and structure**, and **Markdown conventions** sections. They are binding
here too and are not repeated below. In particular: ASCII only, no version numbers, no
volatile metrics, the do-not-claim guardrails, and every paragraph and bullet on a single
source line.

## Finding work to do

1. List candidates: every directory under `temp/` that contains a `job.txt`.
2. **Skip any directory that already contains generated documents** - that is, any `.md`
   other than `job.txt`, or any `.pdf` or `.docx`. Do not regenerate and do not overwrite.
   Report skipped folders by name so Michael knows they were seen and left alone.
3. If no directory qualifies, say so plainly and stop. Do not invent a folder, and do not
   fall back to generating into `dist/`.
4. If several qualify, process each one fully before moving to the next.

## Per application

Work in the job's own directory. Name files with today's date from `date +%Y%m%d`:

- `temp/<folder>/mryan-resume-YYYYMMDD.md`
- `temp/<folder>/mryan-cover-YYYYMMDD.md`

Steps:

1. Read `job.txt` in full. Identify what the role actually screens for: the technologies,
   the seniority, the kind of engineering (product, platform, infrastructure), and any
   explicit requirements such as communication, documentation, or responsible AI use.
2. Say briefly, before writing, which of Michael's evidence maps to those requirements and
   where the gaps are. This is the useful part of tailoring; skipping it produces a generic
   document with the company name pasted in.
3. Write both markdown files.
4. Build them:
   `./build-docs.sh temp/<folder>/mryan-resume-YYYYMMDD.md temp/<folder>/mryan-cover-YYYYMMDD.md`
   Output lands next to the source.
5. Verify: `pdfinfo` for page counts, `LC_ALL=C grep -c '[^ -~\t]'` returning `0` for both
   markdown files, and render at least one page with `pdftoppm` and look at it. A correct
   page count does not prove the text flows correctly.

## Tailoring

- Reorder and reweight; do not invent. The evidence is fixed, the emphasis is not.
- Lead with level. Michael is targeting Staff, Principal, or Lead roles.
- Name gaps rather than hiding them. His recent contracts read C#/.NET heavy; against a
  TypeScript-first shop, address that directly and point at the TypeScript work that
  exists rather than hoping nobody notices.
- The cover letter opening must be specific to this company and this posting. A paragraph
  that would work for any employer is worse than no paragraph.
- The letter carries reasoning, the resume carries record. Do not restate one in the other.
- Where the posting names something Michael has no evidence for, leave it out. Do not
  reach, and do not soften a guardrail because the posting would reward crossing it.

## Reporting

For each application processed: the folder, page counts for both documents, and any claim
you could not source from `about-me.md` or the expanded resume, so Michael can confirm or
cut it before sending. Then list any folders skipped and why.

## Note

`temp/` is gitignored, so anything generated there is not under version control and is not
recoverable if deleted. Mention this once if Michael seems to be treating a folder there as
durable storage.
