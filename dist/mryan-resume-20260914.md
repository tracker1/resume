# Michael J. Ryan

Phoenix, AZ, USA | Remote<br />
resume@tracker1.dev | (480) 270-4509 | tracker1.dev

- LinkedIn: https://www.linkedin.com/in/tracker1
- GitHub: https://github.com/tracker1
- StackOverflow: https://stackoverflow.com/users/43906/tracker1
- NPM: https://npmjs.com/~tracker1

## Summary

Staff and principal level engineer and architect with close to 30 years of experience, most recently acting Principal Developer/Architect on a greenfield election management platform for the City of Phoenix. Before that, Staff Engineer at ServiceTitan and Blankfactor, and earlier, lead developer, senior architect and Director of Software Development. What those roles have in common is owning the technical direction of a system and staying accountable for it well past the first release. Much of that work has been shared foundations other engineers build on: a customer-facing API platform, a reusable authentication and access control service, internal libraries, and CI/CD tooling. Michael works the full stack, from database schemas and API contracts to React front ends, writes designs down with the reasons behind them, and mentors, holding that every team using an abstraction pays for it, so it had better earn its place.

## Core Skills

- **Languages:** JavaScript (since 1997), SQL (since 1999), C# (since 2001), TypeScript (since 2013), Rust (personal projects, since 2023), Go
- **Back-End:** Node.js (since 2011), Deno, Express, Koa, Hono, Apollo GraphQL, .NET and .NET Framework, ASP.NET (MVC, Web API, Web Forms), FastEndpoints, Dapper, WCF
- **Front-End:** React (since 2013), Redux, MobX, Zustand, MUI, Mantine, Angular, Vue, Next.js, HTMX, HTML5, CSS3
- **Messaging and Data:** Kafka, RabbitMQ, Azure Storage Queues, Redis, Microsoft SQL Server, PostgreSQL, DynamoDB, SQLite, MySQL, MongoDB, Cassandra, Elasticsearch, Azure Cognitive Search
- **Cloud and DevOps:** AWS (Lambda, DynamoDB, S3, Elastic Beanstalk), Azure (DevOps, Functions, Storage, API Gateway, Kubernetes Service), Cloudflare Pages and Workers, Kubernetes, Helm, Docker, Terraform, GitHub Actions
- **Architecture and Practice:** Solution architecture, API and shared library design, contract-first design, authentication and RBAC, identity provider integration (Azure AD, Auth0, Okta, Identity Server), microservices, OpenAPI documentation and client generation, unit testing, conformance test harnesses, design documentation and decision records, code review, mentoring

## Professional Experience

### Software Developer - Intersect Group (City of Phoenix)
Apr 2025 - Sep 2026 | Phoenix, AZ (Remote, Contract)

- Acting Principal Developer/Architect on a new Election Management Services platform for the City Clerk's office, a greenfield web system for running city elections.
- C# and .NET back end with FastEndpoints, using Dapper against Microsoft SQL Server. React front end with Mantine and Zustand.
- Wrote most of the CI/CD build and automation tooling in TypeScript, run under Deno inside GitHub Actions.

### Software Engineer - Staffing Science (Consumer Cellular)
Feb 2025 - Jun 2025 | Phoenix, AZ (Remote, Contract)

- Worked with the Carrier Team on integrations between MVNO services and the underlying carriers, and exposed APIs from those services to other internal systems.
- C#, .NET, ASP.NET MVC and WCF services against Microsoft SQL Server, with Kafka and RabbitMQ for messaging. Vue and TypeScript on the front end.

### Lead Developer - Independent
Dec 2024 - Feb 2025 | Phoenix, AZ (Remote)

- Architected and built a retail hardware kiosk platform in TypeScript end to end: React and Next.js on the front, Express and Apollo GraphQL services, PostgreSQL and CockroachDB underneath.
- Built a Chrome extension with Deno, TypeScript and ESBuild that records browser tab content and streams it to a backend for review.
- Designed a proof-of-concept social platform as a lightweight serverless stack on Cloudflare Pages with Hono, HTMX and Turso.

### Staff Engineer - Blankfactor (Bank of America)
Apr 2024 - Oct 2024 | Phoenix, AZ (Remote)

- Member of the solution architecture team for a merchant services application uplift, producing the Strategic Architectural Diagrams that guided development planning.
- Gave technical input during product planning and PI initiatives, with the aim of development efficiency and architectural clarity.

### Lead Developer - Yoh (First American Title Insurance Company)
May 2023 - Aug 2023 | Phoenix, AZ (Remote, Contract)

- Led ongoing development, refactoring and enhancements on the title and platform team for a multi-agency title process and workflow application.
- Node.js services on AWS Lambda over DynamoDB behind Apollo GraphQL. Terraform for AWS deployments, GitHub Actions for CI/CD.
- React and TypeScript front end using the Apollo client for data and caching, with MUI as the base component layer beneath the company's internal micro-UI platform library.

### Senior Software Developer - Vaco (HCA / HealthTrust)
Oct 2022 - Apr 2023 | Phoenix, AZ (Remote, Contract)

- Led the UI refinement and refactor, and set ongoing front-end practices, for a procurement marketplace where multiple client locations order office and medical supplies. Mentored other developers alongside hands-on work.
- Moved the component base from Bootstrap to MUI to match corporate direction.
- Used NSwag to generate the API documentation, swagger-ui interfaces and the client library the React front end called through, so the front end and back end shared one contract.
- ASP.NET Web API back end with Dapper over Microsoft SQL Server, on Azure with Terraform and Azure DevOps.

### Staff Engineer II - ServiceTitan
Oct 2021 - Sep 2022 | Phoenix, AZ (Remote)

- Design lead and principal developer for the Application Platform API, the customer-facing API surface that external integrators build against.
- Carried that contract from endpoint design through implementation, along with the long-lived compatibility obligations a public API brings.
- .NET with ASP.NET MVC and Web API using Dapper, against Microsoft SQL Server and PostgreSQL. Internal tooling built with Razor from partially generated templates.
- React and TypeScript with MobX and MUI on some front-end applications. Azure, Kubernetes, Helm, Kafka and Identity Server around it.

### Senior Software Developer - Runbeck Election Services, Inc.
Jun 2018 - Sep 2021 | Phoenix, AZ (Hybrid)

- **Auth App.** Designed and was principal developer on an authentication and role-based access control service used by Runbeck applications that did not already sit behind a platform like Azure AD or Auth0, for internal deployments and for several states and local jurisdictions. Defaults meet or exceed NIST guidelines, with per-deployment overrides.
  - The same codebase ran in three places: embedded on ARM hardware Runbeck supplied to customers, inside customer infrastructure, and in the cloud. Persistence sat behind a key/value interface, with SQLite embedded, adapters for Microsoft SQL Server or PostgreSQL, and an optional encryption layer for SQLite at rest.
  - Carried the service through a difficult .NET Core 2 to 3 migration mid-development, which the ARM deployments required.
  - Built the adapters that connected the RBAC model to Azure AD, Auth0 and Okta.
- **Vocem.** Designed and was principal front-end developer on a petition scanning and validation application used by several states and local jurisdictions. Much of the effort went into presenting scanned documents together with their markup overlays. React, Redux and MUI, moving from class components to hooks during 2019.
- **Vocem Online.** Architected the front end and back end of the first online ballot endorsement petition platform used in the US, a pilot for the City of Boulder, Colorado. React, Redux and MUI; Node.js and Koa over PostgreSQL, picked for portability and a scaling path to CockroachDB, deployed with Terraform to Azure Kubernetes Service.

### Senior Software Developer - Berkadia
Oct 2017 - May 2018 | Phoenix, AZ (Onsite)

- Member of the Platform Architecture Team, alongside product work on DesignView, a suite for producing InDesign marketing materials from design concepts.
- Developed a composite build system so the team could write modern JavaScript and still emit Adobe ExtendScript for InDesign Server. Angular, React, Redux, Node.js, Koa, Webpack, Babel and Docker across the suite.

### Senior Developer / Architect - Emailage
Jan 2017 - Aug 2017 | Chandler, AZ (Onsite)

- Designed and built the company's first microservice, a Node.js service on AWS Elastic Beanstalk relaying data from Redis, with 100% unit test coverage.
- Rewrote a customer CSV job processor to run inside the Lambda runtime limit. The earlier version handled about half a million records in that window; the rewrite handled more than three million.
- Built an ETL pipeline that loaded over 300 million Whois records into DynamoDB, throttled to stay within its limits.
- Designed a next-generation customer portal in Node.js, Express, React and MUI.

### Earlier Experience (2003 - 2016)

Engineering roles, mostly senior or lead, at **American Express** (through IntraEdge), **GoDaddy**, **ClassicCars.com**, **US Airways**, **Wells Fargo**, **Florida Blue/BCBS**, **Inxsol** (including Director of Software Development), **Apollo Group / University of Phoenix**, and others. Selected work:

- **Apollo Group:** wrote Apollo.Common, a shared library for application configuration with an enhanced memcached client and the start of a common logging system. Cut a portal landing page from eight seconds to under one, and a report from over five minutes to under twenty seconds.
- **ClassicCars.com:** lead developer and architect across two engagements. Cut average page load time by over 85%. Replaced the search back end with a Node.js and MongoDB service fed from Microsoft SQL Server through RabbitMQ, at about half the overhead. Later worked on moving the platform to containerized microservices on Azure.
- **GoDaddy:** Website Builder under Platform and Commerce, including migrating services to a new Node.js framework and advocating internally for Node.js.
- **US Airways:** extended an internal dependency injection framework so other developers could mount and consume WCF services more easily, over both SOAP and JSON. On a separate engagement, rebuilt the web check-in front end, cutting payload by more than half and speeding up page loads about tenfold.
- **Inxsol:** as Director, ran several simultaneous projects across three international locations while developing. Worked on a multi-tier incident command training platform whose web tier, WCF message router and simulation engine could each scale onto separate systems.

## Independent Projects and Open Source

- **Cross-runtime database drivers.** A shared core package gives MSSQL, ODBC and SQLite drivers one API surface. The ODBC adapter is written in Rust over FFI so Node.js, Deno and Bun share a single implementation.
- **Specification recovery and preservation.** Reconstructed a working specification for a protocol whose vendor folded decades ago, using alpha builds, binaries and help files. Published it openly and coordinated with an independent implementer to keep both efforts aligned. Currently documenting a 29-year-old platform for preservation, and binary-patching abandoned applications so they run on current systems.
- **Conformance testing against ground truth.** For a renderer that has to match legacy behavior, designed a harness that drives the original software under emulation, captures its output, and compares it against the new implementation using an explicit tiered tolerance policy.
- Long-standing top-ranked StackOverflow contributor, active on GitHub across JavaScript, TypeScript, Node.js, Go and Rust, and maintainer of several published NPM packages.
