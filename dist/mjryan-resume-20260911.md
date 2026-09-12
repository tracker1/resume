# Michael J. Ryan

Phoenix, AZ, USA | Remote<br />
resume@tracker1.dev | (480) 270-4509 | tracker1.dev

- LinkedIn: https://www.linkedin.com/in/tracker1
- GitHub: https://github.com/tracker1
- StackOverflow: https://stackoverflow.com/users/43906/tracker1
- NPM: https://npmjs.com/~tracker1

## Summary

Staff and principal level engineer and architect with close to 30 years of experience, currently acting Principal Developer/Architect on a greenfield election management platform. Staff Engineer at ServiceTitan and Blankfactor, with lead developer, senior architect and engineering director roles before that. The constant across them is owning technical direction for a system and staying accountable for it long after the first release. Much of that work has been on shared foundations other engineers build on: a customer-facing API platform, a reusable authentication and access control service adopted across a company's applications, internal libraries, and build tooling. I work the full stack, from database schemas and API contracts through messaging architecture to React front ends. I set standards, review carefully and mentor, write designs down along with the decisions behind them, and hold that the cost of an abstraction is paid by every team that has to use it.

## Core Skills

- **Languages:** JavaScript (since 1997), SQL (since 1999), C# (since 2001), TypeScript (since 2013), Go, Rust
- **Back-End:** Node.js (since 2011), Deno, Express, Koa, Hono, Apollo GraphQL, .NET and .NET Framework, ASP.NET (MVC, Web API, Web Forms), FastEndpoints, Dapper, WCF
- **Front-End:** React (since 2013), Redux, MobX, Zustand, MUI, Mantine, Angular, Next.js, HTMX, HTML5, CSS3
- **Messaging and Data:** Kafka, RabbitMQ, Azure Storage Queues, Redis, Microsoft SQL Server, PostgreSQL, DynamoDB, SQLite, MySQL, MongoDB, Cassandra, Elasticsearch, Azure Cognitive Search
- **Cloud and DevOps:** AWS (Lambda, DynamoDB, S3, Elastic Beanstalk), Azure (DevOps, Functions, Storage, API Gateway, Kubernetes Service), Cloudflare Pages and Workers, Kubernetes, Helm, Docker, Terraform, GitHub Actions
- **Architecture and Quality:** Solution architecture, shared library and API design, contract-first design, authentication and RBAC, identity provider integration (Azure AD, Auth0, Okta, Identity Server), microservices, OpenAPI documentation and client generation, unit and integration testing, conformance test harnesses, design documentation and decision records, code review, mentoring

## Professional Experience

### Software Developer - Intersect Group (City of Phoenix)
Apr 2025 - Present | Phoenix, AZ (Remote, Contract)

- Acting Principal Developer/Architect on a new Election Management Services platform for the City Clerk's office, a greenfield web system for managing city elections.
- Back end in C# and .NET with FastEndpoints over Microsoft SQL Server using Dapper; front end in React with Mantine and Zustand.
- Wrote the bulk of the build and automation tooling in TypeScript, running under Deno.

### Software Engineer - Staffing Science (Consumer Cellular)
Feb 2025 - Jun 2025 | Phoenix, AZ (Remote, Contract)

- Built integration services for MVNO offerings and the underlying carriers on the Carrier Team, using Kafka and RabbitMQ for messaging between systems, and exposed APIs from those services for other internal systems.
- Vue and TypeScript on the front end; C#, .NET, ASP.NET MVC and WCF services against Microsoft SQL Server.

### Lead Developer - Independent
Dec 2024 - Feb 2025 | Phoenix, AZ (Remote)

- Architected and built a retail hardware kiosk platform, TypeScript end to end: React and Next.js front end, Express and Apollo GraphQL services, PostgreSQL and CockroachDB.
- Built a Chrome extension in Deno and TypeScript with an ESBuild pipeline to capture and stream tab content to a review backend, and a proof-of-concept serverless social platform on Cloudflare Pages with Hono, HTMX and Turso.

### Staff Engineer - Blankfactor (Bank of America)
Apr 2024 - Oct 2024 | Phoenix, AZ (Remote)

- Member of the solution architecture team on a merchant services application uplift, producing the Strategic Architectural Diagrams used to guide development planning.
- Provided technical input during product and PI planning across teams, aimed at development efficiency and architectural clarity.

### Lead Developer - Yoh (First American Title Insurance Company)
May 2023 - Aug 2023 | Phoenix, AZ (Remote, Contract)

- Led ongoing development, refactoring and enhancements on the title and platform team for a multi-agency title process and workflow application.
- Node.js services on AWS Lambda over DynamoDB behind an Apollo GraphQL layer, with Terraform-managed infrastructure and GitHub Actions CI/CD.
- React with TypeScript on the front end, using the Apollo client for data interaction and caching, with MUI as the base component layer under the company's internal micro-UI platform library.

### Senior Software Developer - Vaco (HCA / HealthTrust)
Oct 2022 - Apr 2023 | Phoenix, AZ (Remote, Contract)

- Led the UI refactor and established ongoing front-end practices for a procurement marketplace used by multiple client locations to order office and medical supplies, combining hands-on development with mentoring other developers.
- Migrated the component base from Bootstrap-derived components to MUI to align with corporate direction.
- Used NSwag to generate the OpenAPI documentation, swagger-ui interfaces and the typed client library the React front end called through, keeping front-end and back-end contracts in sync.
- .NET back end with ASP.NET Web API and MVC over Microsoft SQL Server, on Azure with API Gateway, Cognitive Search, Functions and Storage, deployed through Azure DevOps and Terraform.

### Staff Engineer II - ServiceTitan
Oct 2021 - Sep 2022 | Phoenix, AZ (Remote)

- Led the design of, and did the principal development on, the Application Platform API: the customer-facing API surface that external integrators build against. Carried that contract from endpoint design through implementation, including the long-lived compatibility obligations that come with a public API.
- Externally facing API in .NET with ASP.NET MVC and Web API using Dapper, against Microsoft SQL Server and PostgreSQL. Internal tooling built from partially generated templates.
- React with TypeScript and MobX on several front-end applications, with MUI for components.
- Surrounding platform services: Azure, Kubernetes, Helm, Kafka and Identity Server.

### Senior Software Developer - Runbeck Election Services, Inc.
Jun 2018 - Sep 2021 | Phoenix, AZ (Hybrid)

- **Auth App.** Designed and was principal developer on a reusable authentication and role-based access control service, adopted by Runbeck applications that did not already sit behind an identity platform such as Azure AD or Auth0. NIST-aligned defaults with per-deployment overrides.
  - Persistence sat behind a key/value interface: SQLite embedded, with adapters to reuse Microsoft SQL Server or PostgreSQL, and an optional encryption layer for SQLite at rest. The same codebase ran embedded on ARM-based hardware supplied to customers, in customer infrastructure, and in the cloud.
  - Wrote the companion adapters integrating the RBAC model with Azure AD, Auth0 and Okta, and led a difficult .NET Core migration mid-development required for the ARM targets.
- **Vocem.** Principal front-end developer on a petition scanning and validation application used by several states and local jurisdictions. React, Redux and MUI, moving from class components to hooks as they became available.
- **Vocem Online.** Architected and built the first online ballot endorsement platform used in the US, a pilot for the City of Boulder, Colorado. Node.js with Koa over PostgreSQL, deployed with Terraform to Azure Kubernetes Service.

### Senior Software Developer - Berkadia
Oct 2017 - May 2018 | Phoenix, AZ (Onsite)

- Member of the Platform Architecture Team alongside product work on DesignView, an application suite for producing InDesign marketing materials from design concepts.
- Built a composite build system that let the team author in modern JavaScript while emitting Adobe ExtendScript, replacing hand-written legacy scripting with a maintainable toolchain. Angular, React, Redux, Node.js, Koa, Webpack, Babel and Docker across the suite.

### Senior Developer / Architect - Emailage
Jan 2017 - Aug 2017 | Chandler, AZ (Onsite)

- Designed and built the organization's first microservice, a Node.js service on AWS Elastic Beanstalk relaying data from Redis, shipped with full unit test coverage as the reference pattern for services that followed.
- Rewrote a customer CSV job processor to fit inside the AWS Lambda runtime limit, raising throughput from roughly half a million records to more than three million in the same window.
- Built an ETL pipeline moving over 300 million Whois records into DynamoDB, throttled to stay within provisioned limits.
- Designed a next-generation customer-facing portal in Node.js, Express, React and MUI.

### Earlier Experience (2003 - 2016)

Engineering roles, mostly senior or lead, at **American Express** (through IntraEdge), **GoDaddy**, **ClassicCars.com**, **US Airways**, **Wells Fargo**, **Florida Blue/BCBS**, **Inxsol** (including Director of Software Development), **Apollo Group / University of Phoenix**, and others. Representative work:

- **Apollo Group:** wrote `Apollo.Common`, a shared library for application configuration with an enhanced memcached client and common logging, used across a diverse application portfolio. Cut a portal landing page from eight seconds to under one, and a report from over five minutes to under twenty seconds.
- **ClassicCars.com:** lead developer and architect across two engagements. Reduced average page load time by over 85%, replaced the search back end with a Node.js and MongoDB service fed from Microsoft SQL Server through RabbitMQ at roughly half the prior overhead, and later moved the platform toward containerized microservices on Azure.
- **GoDaddy:** worked on Website Builder under the Platform and Commerce organization, and advocated internally for moving infrastructure onto Node.js.
- **US Airways:** built extensions to an internal dependency injection framework that made creating, mounting and consuming WCF services easier for other developers across SOAP and JSON endpoints; separately rebuilt the web check-in front end, cutting payload by more than half and improving load time roughly tenfold.
- **Inxsol:** architected a multi-tier incident command training platform with a message-queue router separating the web tier, routing tier and simulation engine so each could scale independently.

## Independent Projects and Open Source

- **Cross-runtime database drivers.** A shared core package gives MSSQL, ODBC and SQLite drivers one API surface, with the ODBC adapter written in Rust over FFI so Node.js, Deno and Bun are served from a single implementation.
- **Specification recovery and preservation.** Reconstructed a working specification for a protocol whose vendor folded decades ago, from alpha builds, binaries and help files, then published it openly and coordinated with an independent implementer so both efforts stayed aligned.
- **Conformance testing against ground truth.** For a renderer that must match legacy behavior, built a harness that drives the original software under emulation, captures its output and diffs it against the new implementation, with an explicit tiered tolerance policy.
- Long-standing top-ranked StackOverflow contributor, active on GitHub across JavaScript, TypeScript, Node.js, Go and Rust, and maintainer of several published NPM packages.
