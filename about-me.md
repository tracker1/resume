# Technical Profile: Michael

> Reference document for cover letter and resume generation. Describes engineering
> temperament, design philosophy, and working patterns as demonstrated across
> professional and personal projects. Intended to be paired with the expanded resume
> and work history when generating role-specific cover letters. Section 8 carries
> presentation rules and a do-not-claim list that generated documents must follow.

---

## 1. Summary

Michael is a software developer with close to 30 years of professional experience
(JavaScript since late 1997, SQL since 1999, C# since 2001), positioned for remote
Principal/Staff-level roles. His defining trait is a bias toward **durable,
boring-in-the-good-way systems**: software that outlives its original team, can be picked
up years later, and doesn't require constant re-platforming to stay viable.

He is a builder of complete systems rather than a specialist in one layer. He is equally
comfortable designing a binary file format, a database schema, a WebSocket protocol, a
React component architecture, or a Docker distribution strategy, and treats all of these
as the same discipline: deciding what the boundaries are and keeping them clean.

He runs his own LLC (Roughneck Development) commercializing software products, which
means his design instincts have been tested against distribution, licensing, support, and
long-term maintenance costs, not only "does it ship."

---

## 2. Core Engineering Philosophy

### KISS and YAGNI, applied with discipline

These are not slogans for Michael; they show up in concrete decisions:

- Removed a chunked/resumable upload protocol (tus) from a product in favor of simple
  streamed multipart, because the complexity wasn't earning its keep.
- Abandoned a bespoke image container format he had already designed in favor of
  LZ-compressing a standard palettized BMP, because it was easier to implement, closer
  to the actual spec being targeted, and lost nothing that mattered.
- Rejected replaying vector shapes at output resolution in a renderer in favor of a
  simple staged canvas pipeline, explicitly because the simpler approach wouldn't freeze
  or flicker under real usage.

The pattern: he will design the elaborate version, evaluate it, and then discard it
without ego if a simpler approach covers the real requirement.

### Abstractions have to earn their place

The conviction, in his own framing: the cost of an abstraction is paid by every team
that has to use it, so it had better be earning its place. Interfaces, layers, and
patterns are not free even when they are idiomatic; each one is a tax on everyone
downstream who has to read through it, mock it, or extend it.

The lived counterexample is ServiceTitan (2021-2022). Architecture standards there were
set company wide around a heavily layered .NET "Clean Architecture" approach that
required extensive interfaces and patterns which, in practice, did not add value
proportional to their cost. His scope was the customer-facing Application Platform API
(design lead and principal developer), not the architecture, so he had very limited
influence over that framework. Working inside it for a year is a large part of why he
left, and it is the experience that turned a general KISS preference into a specific
position about shared code: when you own a foundation other teams build on, the burden
of proof is on the abstraction, not on the person asking why it exists.

For generated documents: present this as a conviction about abstraction cost, not as a
complaint about a former employer. He does not want to read as negative about
ServiceTitan.

### Design for the lifespan of the system, not the sprint

- Reserves namespaces (`/api/ws/*`, `/auth/api/*`) ahead of need so future additions
  don't require breaking changes, while deliberately _not_ building the future features.
- Isolates replaceable concerns (e.g., an authentication module) behind a boundary so
  enterprise SSO/OIDC can be added later without touching application routes.
- Uses open, evolvable structures where change is expected (a fixed log envelope with a
  free-form `detail` sub-object) rather than rigid schemas that will fight every new
  event type.
- Prefers durable formats and storage (SQLite/libsql, plain markdown, git-recoverable
  indexes) over proprietary or fashionable alternatives.

### Boundaries and contracts first

Michael consistently defines the _contract_ before the implementation:

- A browser terminal's contract is "a pure CP437/ANSI byte stream"; all Telnet IAC
  negotiation is pushed into a bridge so the client stays simple.
- A door-authoring kit uses a sideband JSON protocol so game logic and I/O transport are
  cleanly separated and multiple host platforms can be supported via plugins.
- Database adapters share a `@tsdriver/core` package so MSSQL, ODBC, and SQLite drivers
  present the same API surface.
- UI components are split into four files (container, pure UI, mock, types) so rendering
  is testable without Redux or WebSocket wiring.

The same instinct shows up professionally. The Runbeck auth/RBAC service put persistence
behind a key/value interface so one component could run embedded on ARM hardware, on
premises, or in the cloud, and the ServiceTitan API work was, day to day, mostly about
the contract: what an external integrator can rely on a year after it ships.

### Operational realism

He designs for the environment as it actually is, not as documentation claims:

- Liveness probing for a directory service runs from two vantage points on separate
  networks, gated on two independent control hosts, because "even major providers have
  downtime" and a single-vantage failure produces false negatives.
- Grace periods, reconnect windows, and stale/delist policies are specified with concrete
  time values and escalation steps (probe -> warn sysop -> soft-delist -> retain legacy
  URL).
- Docker images that ship with SMB/CIFS dependencies enabled, because a user hitting
  a missing dependency at runtime is a support ticket, not a feature.
- Session invalidation is designed end-to-end (publish -> forced close -> rejection on
  reconnect), rather than a bare "delete the token."

---

## 3. How He Approaches Design Work

### Writes it down before building it

Projects carry living design documentation (`DESIGN.md`, `PLANNING.md`, `TODO.md`,
`DONE.md`) that is updated as decisions are made. Architectural decisions are recorded
as decisions, with the rejected alternative and the reason, rather than as outcomes
alone.

He also has strong opinions on _what_ documentation is for: agent/AI instruction files
should be lean ("pointers and guardrails, not exhaustive documentation"); READMEs serve
different audiences in public vs. commercial repos; CONTRIBUTING guidance belongs in the
public repo.

### Reverse-engineers when the spec doesn't exist

When targeting a protocol whose original vendor folded decades ago, he reconstructed a
working specification from alpha builds, binaries, and help files, then published it as
an open repository and coordinated with a parallel independent implementer to keep both
efforts aligned. This is characteristic: when the ground truth isn't documented, he
recovers it rather than guessing.

This is ongoing, not historical. As of 2026 he is reverse engineering and documenting a
29 year old platform for preservation, and has used binary monkey-patching to get a few
abandoned applications running again on current systems. AI tooling is part of how he
does this work now (see section 5), but the habit predates it.

### Tests against ground truth, with explicit tolerance policies

For a renderer that must match legacy behavior, he designed a conformance harness that
drives the _original_ software under emulation, captures output externally, and compares
against the new implementation. The tolerance policy is tiered and explicit:
pixel-perfect where the case is deterministic, ~3-5% variance or manual "looks alike"
checks where the original behavior was itself approximate. Expensive test tiers run
before releases rather than on every commit.

He also holds a firm rule: **never assume a failing test is wrong**. Investigate the
implementation first, ask if uncertain.

### Scopes aggressively

- A multi-year CHM viewer idea was narrowed to a single first deliverable: a CLI that
  converts `.chm` to a self-contained HTML file.
- A DOS door hosting service is explicitly "DOS doors only"; Linux and other hosts are
  named as separate future sibling services, not scope creep.
- A terminal client's v1 is "general ANSI over telnet, SSH, and WebSockets"; graphics
  protocol support and UTF-8 are explicitly deferred.

He names the future work so it doesn't get accidentally built now.

### Thinks in editions, licensing, and distribution

Products are structured as editions (Community, Desktop, Server, Pro, Enterprise) with
deliberate licensing choices. His default for open work is ISC: permissive, short, and
unambiguous. He will use MIT or BSD instead where an ecosystem's convention makes one of
those the expected choice, since matching what a community already reaches for lowers
friction for the people adopting it.

He does not favor copyleft. GPL and LGPL appear in his projects for two reasons only:
he is adapting something that is already GPL and has no choice, or the copyleft is
itself the strategic point. The BUSL 1.1 commercial licensing with a time-based
conversion is the second case, and the conversion target is GPL-compatible because BUSL
1.1 requires that, not because he prefers it. Read any GPL in his work as a constraint
he accepted rather than a position he holds.

Distribution mechanics (unsigned single executables via GitHub releases, AppImage/Flatpak
bundling, Docker image composition) are design decisions, not afterthoughts.

---

## 4. Technical Range

**Languages and runtimes:** C#/.NET (since 2001; primary in the current role and most
recent contracts), TypeScript/JavaScript (longest tenure; JavaScript since 1997,
TypeScript since 2013, professional use across most roles), T-SQL (since 1999), Rust
(first worked with it in 2021, in sustained use since 2023; personal and product work,
not yet professional). Deno is the preferred runtime for scripts and orchestration so
repository modules can be referenced without a separate install step. This is now
professional practice rather than only personal: on the current City of Phoenix election
management contract (Apr 2025 to present) he wrote the bulk of the build and automation
tooling in TypeScript under Deno.

**Backend:** Rust (Axum), C# (ADO.NET, Dapper, FastEndpoints), Node.js since 0.6 in 2011
on Linux, in production from 0.8 in 2012 building the ClassicCars.com search service
(Express, Koa, Hono, Apollo GraphQL), REST and WebSocket APIs, MQTT internal messaging,
JWT/role normalization pipelines, multi-protocol networking (FTP/SFTP/SMB/S3/Azure Blob;
BinkP/QWK/NNTP; Telnet/SSH/rlogin). Professional messaging work with Kafka, RabbitMQ,
and Azure Storage Queues.

**Frontend:** React since 2013, shortly after its first public release, currently React
19 with MUI and hand-written Redux (deliberately "manual over the toolkit") on personal
work; React with Mantine UI and Zustand on the current professional contract; MobX at
ServiceTitan. SharedWorker-multiplexed WebSockets with state hydration from
server-pushed deltas, Storybook with theme decorators for component development.

**Data:** SQLite/libsql/Turso, FTS5 full-text search, MSSQL, PostgreSQL, ODBC. Currently
building a cross-system ODBC database adapter for Node, Deno, and Bun in Rust over FFI.
Comfortable designing schemas with per-domain or per-area database partitioning, content
hashing (CRC-32, SHA-256), and R2/S3-backed sync with conditional writes.

**Infrastructure:** Docker, Kubernetes/Helm, Terraform, Cloudflare Workers and R2,
OVH-hosted Rust services, Stripe licensing infrastructure, GitHub Actions/`gh` CLI
automation, git worktrees for parallel branch work.

**Systems and low-level:** Binary format design, LZ compression, CPU emulation (Fast486
port to Rust), HLE DOS layers, FOSSIL/serial emulation, WASM rendering pipelines with
GPU-scaled output (xBR/hqx), Tauri v2 desktop apps, Wine/DOSBox-X packaging, binary
patching of legacy executables.

**Domain depth:** Deep BBS/FTN/QWK expertise (Synchronet, JAM/Squish message bases,
classic FTN networking). Has historically operated multi-network gated message areas.
This is a niche domain, but it demonstrates a career-long habit of understanding
protocols and formats at the byte level.

---

## 5. Working Style with AI-Assisted Development

Michael has a considered, experience-grounded position on AI-augmented development
rather than either hype or dismissal:

- Treats AI coding agents as throughput multipliers gated by human review capacity. His
  "gatekeeper model" argues that human review throughput should be the cost bound on
  agent spend, with a 20-30% sustained gain as a realistic baseline rather than the
  10x often claimed.
- Recognizes a practical cognitive ceiling (~5 hours/day) for high-quality gating work
  and plans around it.
- Treats documentation and tests as **structural requirements** rather than nice-to-haves
  when agents are producing code, because they are the review surface.
- Builds tooling around this: PR creation/validation scripts so agent sessions can open
  and check PRs autonomously; worktree conventions (`epic-N/story-description`) so
  backend and frontend sessions run in parallel; lean agent instruction files that act
  as guardrails rather than manuals.
- Has built a remote session manager for AI coding CLI sessions with usage-aware
  throttling. He treats agent usage as a resource to be budgeted, like any other.

### Model selection: intent inference over speed

His criterion for a good coding model is how well it infers intent. A model that guesses
wrong produces confidently sub-par work, and the cost of finding and unwinding that is
higher than the time the model saved. So he makes a deliberate tradeoff: for anything
headed into shared code, he will take a slower model that follows intent over a faster
one that does not.

Specifics, as of September 2026:

- Claude Opus models since 4.5 are his default. Fable's results he rates very highly, but
  Opus performs nearly as well at code generation and intent-following without taking as
  long, so it gets most of the use.
- GitHub Copilot's default agent is his clearest negative example: poor at understanding
  intent, output often wrong or sub-par.
- Google, OpenAI, and Grok models he has not really used for coding. He has learned not
  to trust Google's AI answers on code search queries; they are often incomplete or
  missing necessary references. OpenAI has been decent in limited use. Grok he finds
  good for current events and has not tried for code.

### Where the AI use actually is

Most of his AI-assisted work is on personal projects rather than his primary job.
Current uses:

- Reverse engineering and documenting a 29 year old platform for preservation.
- Building a cross-system ODBC database adapter for Node, Deno, and Bun using Rust and
  FFI.
- Binary monkey-patching to revive abandoned applications.
- Expanding tests and documentation on projects he is actively working on.

These are worth noticing as a set. Every one of them is an instance of something this
document already describes: recovering ground truth when the spec is gone (section 3),
modernization and restoring orphaned software (section 6), a shared driver surface across
runtimes (section 2, `@tsdriver/core`), and documentation and tests as the review surface
(above). The AI use did not create these habits. It is being pointed at them.

The through-line: he applies the same KISS/YAGNI/durability lens to AI tooling that he
applies to everything else. A model is a tool that has to earn its place too.

---

## 6. Professional Temperament

- **Pragmatic over dogmatic.** Chooses the standard format, the boring database, the
  simpler protocol, unless there's a concrete reason not to, and then documents the
  reason. The inverse also holds: he has worked inside a mandated pattern-heavy
  architecture (ServiceTitan) and judged it on outcomes rather than on whether it was
  idiomatic. See section 2, "Abstractions have to earn their place."
- **Long horizon.** Comfortable with 6-month product timelines, 5-year licensing
  triggers, and multi-year domain migration plans with redirect overlap.
- **Finishes things.** Restored and publicly re-released orphaned software that was
  effectively lost, rather than leaving it as a personal fix. Still doing this: current
  binary-patching work gets abandoned applications running again rather than treating
  them as a study exercise.
- **Community-minded where it costs nothing.** Publishes specs, crates, and restored
  tools openly; keeps commercial work commercial.
- **Modernization as a specialty.** Much of his work, personal and professional, is
  taking systems built decades ago and making them run correctly on current platforms
  without losing what made them work. This maps directly onto legacy-migration roles.
- **Continuous self-directed learning, at a sustained rate.** Averages roughly 15 hours
  a week on learning and exploration outside of paid work, and has for close to 30 years:
  blog and industry reading, plus hands-on experiments with languages, libraries, and
  tooling. The filter is deliberate. He tracks a wide surface shallowly and digs deep
  only into what he actually needs, which is the YAGNI discipline from section 2 applied
  to his own attention rather than to a codebase. Rust is the standing exception to
  need-driven learning: he completed Rust Essential Training in 2021 and has kept at it
  since, steadily rather than continuously, by preference rather than market demand. He
  would like to use it professionally and has not had the chance. State this as a rate; do not
  multiply it out into a headline total.
- **Experience in lieu of degree.** No college degree; positions close to 30 years of
  professional delivery as the equivalent, backed by the self-directed learning habit
  above. Cover letters should lead with track record and durability of shipped systems
  rather than credentials.

---

## 7. Positioning Themes for Cover Letters

Use these as the narrative spine, selecting the ones that match the role:

1. **Durability.** Systems he builds keep running and stay maintainable for years.
2. **Modernization.** Legacy platform migration done without breaking the domain logic.
3. **Cost efficiency.** Simpler architectures, fewer moving parts, lower support burden;
   a realistic (not inflated) view of AI-augmented throughput.
4. **Full-stack ownership.** From binary formats and database schemas to React UI and
   Docker distribution, with clean boundaries between each layer.
5. **Operational realism.** Designs for outages, reconnects, partial failures, and
   the support tickets that never get filed because the edge case was handled.
6. **Shared foundations.** Has built the pieces other engineers build on: the Runbeck
   auth/RBAC service, `Apollo.Common`, the ServiceTitan customer-facing API surface,
   NSwag-generated clients at HCA, build tooling at Berkadia and on the current contract.
   Pair this with the abstraction-cost conviction from section 2 for platform, developer
   experience, and internal-library roles.

---

## 8. Generation Guidelines

Rules for any resume or cover letter produced from this profile. These come from
Michael directly and override anything a generator might infer from the source files.

### Experience framing

- Say "close to 30 years" of software development experience. Not "over 25," not
  "roughly three decades."
- Per-language tenure, as start years rather than running totals so they stay correct:
  JavaScript since late 1997, SQL since 1999, C# since 2001, Node.js since 2011 (the 0.6
  release, on Linux; production use from 0.8 in 2012), React since 2013, TypeScript since
  2013, Rust first touched in 2021 and in sustained use since 2023.
- Derived counts as of September 2026, for documents that want a number rather than a
  year: JavaScript 28, SQL 27, C# 25, Node.js 15, React 13, TypeScript 13, Rust 3
  sustained (5 since first exposure in 2021).
  Recompute these from the start years above rather than copying them forward.
- On the C# start year, since .NET 1.0 did not ship until early 2002: 2001 covers the
  late ASP+ betas, before the ASP.NET rename. He went deep on .NET in early 2002 after
  reading "C# The Complete Reference," working from the command-line compiler and a
  plain text editor; Visual Studio .NET did not arrive until roughly a year after that.
  That is the answer if anyone questions 25 years of C# against a 2002 release date.

### Presentation preferences

- Soften or omit volatile metrics. No specific counts for npm packages, StackOverflow
  score or answer counts, or GitHub repository or star counts. They drift, and a stale
  number looks worse than none. "Prominent" or "long-standing" is enough.
- Nothing that reads as AI-generated. No em dashes, no en dashes (use a plain hyphen or
  restructure the sentence). No smart quotes; ASCII only. None of the usual AI
  vocabulary (leverage, robust, seamless, passionate, spearheaded, delve, elevate,
  "not just X but Y," and the rest). Vary sentence and bullet length; uniform rhythm is
  its own tell.
- Date ranges as "Apr 2025 - Present" with a plain hyphen.
- Use names rather than pronouns where possible; they/them if a pronoun is needed.

### Do not claim

Claims he could not or did not confirm. Do not let them into generated documents.

- **ServiceTitan architecture.** Do not say he architected, owned, or led architecture
  at ServiceTitan. Architecture standards were set company wide. His scope was the
  Application Platform API surface: its design and its implementation. "Design lead and
  principal developer" is the approved phrasing.
- **ServiceTitan consumers.** The Application Platform API's consumers were external
  integrators. Do not claim internal product teams consumed it.
- **First American Title micro-UI library.** He built on top of the internal micro-UI
  platform library. Do not claim he built it or contributed to it.
- **Anything not in the expanded resume, the work history, or this document.** If a
  generator wants a detail that is not in one of those, it is a question for Michael,
  not a sentence in the draft.
