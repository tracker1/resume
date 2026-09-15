# Michael J. Ryan

Phoenix, AZ, USA | Remote
tracker1@gmail.com | (480) 270-4509
LinkedIn: https://www.linkedin.com/in/tracker1 | GitHub: https://github.com/tracker1

## Summary

Principal and Staff-level software engineer with close to 30 years of experience, most of it on the systems other engineers build on: public API contracts, authentication and access control, shared libraries, and build tooling. Design lead and principal developer for ServiceTitan's customer-facing Application Platform API. Designed an authentication and RBAC service that ran from one codebase on embedded ARM hardware, on customer infrastructure, and in the cloud. Most recently Acting Principal Developer/Architect on a new election management platform for the City of Phoenix.

Works across the whole stack, from SQL schemas and service boundaries to React front ends and CI/CD, in TypeScript and Node.js as readily as C# and .NET. Has worked in banking, payments, insurance, healthcare, and government settings, and on systems carrying transactional state across millions of records. Prefers simple, durable designs, writes decisions down with the alternatives that were rejected, and holds that every shared abstraction has to earn its place.

## Core Skills

- **Architecture and leadership:** API contract design, service boundaries, authentication and RBAC, legacy modernization, design documentation, technical standards, mentoring
- **Languages:** TypeScript (since 2013), JavaScript (since 1997), C# (since 2001), SQL (since 1999), Rust (personal projects), C
- **Back end:** Node.js, Express, Koa, Hono, Next.js, Apollo GraphQL, Deno, ASP.NET MVC and Web API, .NET (Framework through Core and later), FastEndpoints, Dapper
- **Front end:** React, Redux, Zustand, MobX, MUI, Mantine, Angular
- **Data:** Microsoft SQL Server, PostgreSQL, SQLite, AWS DynamoDB, MongoDB, Redis; schema design, stored procedures, large-volume ETL
- **Identity and messaging:** JWT, Azure AD, Auth0, Okta, Identity Server; Kafka, RabbitMQ, Azure Storage Queues
- **Infrastructure:** Azure, AWS (Lambda, DynamoDB, Elastic Beanstalk), Docker, Kubernetes, Helm, Terraform, GitHub Actions, Azure DevOps, Cloudflare Workers

## Professional Experience

### Software Developer (Acting Principal Developer/Architect) - Intersect Group, for the City of Phoenix

Apr 2025 - Sep 2026 | Remote, Contract

- Acting Principal Developer/Architect on a new web-based Election Management Services platform for the City Clerk's office.
- Back end in C# on .NET with FastEndpoints, using Dapper against Microsoft SQL Server.
- Front end in React with Mantine UI and Zustand.
- Wrote the bulk of the CI/CD build and automation tooling in TypeScript under Deno, running as GitHub Actions, so repository modules are referenced directly with no separate install step.

### Software Engineer - Staffing Science, for Consumer Cellular

Feb 2025 - Jun 2025 | Remote, Contract

- Carrier team: integrations between MVNO services and the underlying carriers, plus APIs exposed to other internal systems.
- C#, ASP.NET MVC, WCF, and .NET services on Microsoft SQL Server, with RabbitMQ and Kafka; Vue and TypeScript on the front end.

### Lead Developer - Independent

Dec 2024 - Feb 2025 | Remote

- Architected and built a retail hardware kiosk platform for real-time retail operations in TypeScript, with Next.js and React on the front end and Express and Apollo GraphQL behind it.
- Built a Chrome extension in Deno, TypeScript, and esbuild that records browser tab content and streams it to a back end for review.
- Designed a serverless social platform proof of concept on Cloudflare Pages, HTMX, Hono, and Turso.

### Staff Engineer - Blankfactor, for Bank of America

Apr 2024 - Oct 2024 | Remote

- Solution architecture team for an uplift of the merchant services payments back end.
- Produced strategic architecture diagrams that guided development planning, and gave technical input during product planning and PI initiatives.

### Lead Developer - Yoh, for First American Title Insurance Company

May 2023 - Aug 2023 | Remote, Contract

- Led development, refactoring, and enhancements on the title and platform team for a multi-agency title process management and workflow application.
- Node.js services on AWS Lambda behind Apollo GraphQL, with DynamoDB as the primary store and Terraform for deployment.
- React and TypeScript front end using the Apollo client, built with MUI on top of the company's internal micro-UI platform library.

### Senior Software Developer - Vaco, for HCA/HealthTrust

Oct 2022 - Apr 2023 | Remote, Contract

- Led the UI refinement and refactor, and set ongoing best practices, for a marketplace where many client locations order office and medical supplies. Combined hands-on development with mentoring other developers.
- ASP.NET Web API on .NET with ADO.NET and Dapper against Microsoft SQL Server. NSwag generated the API documentation and the typed client library used by the React and TypeScript front end.
- Moved components from Bootstrap to MUI to match corporate direction. Azure API Gateway, Functions, Cognitive Search, and Storage, with Terraform and Azure DevOps.

### Staff Engineer II - ServiceTitan

Oct 2021 - Sep 2022 | Remote

- Design lead and principal developer for the Application Platform API, the customer-facing API surface that external integrators build against.
- Carried that contract from endpoint design through implementation, including the long-lived compatibility obligations of a public API.
- ASP.NET Web API on .NET with Dapper, across Microsoft SQL Server and PostgreSQL, running on Azure with Kubernetes, Helm, Kafka, and Identity Server. React and TypeScript with MobX on some front-end applications.

### Senior Software Developer - Runbeck Election Services

Jun 2018 - Sep 2021 | Phoenix, AZ, Hybrid

- **Auth App:** Designed and was principal developer on an authentication and RBAC service used by Runbeck's applications, internal deployments, and a few states and local jurisdictions. Defaults met or exceeded NIST guidelines, with overrides for specific needs.
- Put persistence behind a key/value interface so one codebase ran embedded on ARM hardware supplied to customers, on customer infrastructure, and in the cloud. SQLite served as the embedded store with an optional encryption layer at rest; adapters allowed Microsoft SQL Server or PostgreSQL instead.
- Carried the service through a difficult .NET Core 2 to 3 migration, required for the ARM deployments.
- **Authentication adapters:** integrated applications with Azure AD, Auth0, and Okta where an identity platform was already in place.
- **Vocem:** Designed and was principal front-end developer on a petition scanning and validation application used by several states and local jurisdictions.
- **Vocem Online:** Architected the front and back end of the first online ballot petition endorsement platform used in the US, piloted with Boulder, Colorado. Chose PostgreSQL for portability and a CockroachDB scaling path that a SQL Server team could still work with. Node.js and Koa on Azure Kubernetes Service, deployed with Terraform.
- **Sentio:** Designed the architecture to replace a WinForms ballot-on-demand printer manager used by several counties, separating its services from an embedded web interface.

### Senior Software Developer - Berkadia

Oct 2017 - May 2018 | Phoenix, AZ

- Member of the Platform Architecture Team alongside product work on DesignView, a suite that turns design concepts into InDesign marketing materials.
- Built a composite build system so the team could write modern JavaScript and emit Adobe ExtendScript for InDesign Server. Node.js and Koa API in Docker.

### Senior Developer / Architect - Emailage

Jan 2017 - Aug 2017 | Chandler, AZ

- Rewrote the customer CSV pre-processor on AWS Lambda, where each row becomes an API request. The prior version handled about half a million rows within the runtime limit; the rewrite handled more than 3 million in the same window.
- Built an ETL pipeline loading over 300 million Whois records into DynamoDB, throttled to stay within its default limits.
- Delivered the company's first microservice, a Redis relay on Elastic Beanstalk, with full unit test coverage.
- Designed a next-generation customer portal on Node.js, Express, React, and MUI.

## Earlier Experience (2003 - 2016)

- **Brooksource, for Florida Blue** - Senior Architect (2016). Designed Node.js and React reporting projects before the program was scaled back.
- **IntraEdge, for American Express** - Senior Software Developer (2015 - 2016). Modernized the tooling behind email campaign management and partner integration; a React and Redux proof of concept came in at about a fifth of the prior payload.
- **Collector Car Network (ClassicCars.com)** - Lead Developer (2014 - 2015), Senior Developer (2011 - 2013). Lead developer and architect. Replaced search with a Node.js service over MongoDB, fed from SQL Server through RabbitMQ, at about half the overhead. Cut average page load by over 85%. Later worked on its next-generation cloud infrastructure with Docker, Azure queues and tables, and ELK logging.
- **GoDaddy** - Software Developer III (2013 - 2014). Website Builder, in the Platform and Commerce organization; helped migrate services from ASP.NET MVC to a Node.js framework.
- **Volt, for US Airways** - Senior Software Developer (2013). Extended the internal IoC framework so other developers could mount and consume WCF services, SOAP and JSON alike.
- **COMSYS/Experis, for US Airways** - Senior UX Developer (2010 - 2011). Rebuilt the web check-in front end, cutting payload by well over half and page load time by a factor of 10.
- **COMSYS/Experis, for Wells Fargo** - Senior Developer (2009 - 2010). Access Request Tool: WCF integration endpoints, the workflow UI analysts used to manage access-request queues, and approvals served by paged, filtered stored procedures.
- **MDI, for University of Phoenix** - Senior Software Engineer (2008 - 2009). Built Apollo.Common, a shared configuration library with an enhanced memcached client and common logging. Cut a key report from over five minutes to under 20 seconds, and the portal landing page from eight seconds to under one.
- **Inxsol** - Director of Software Development (2011), Senior Developer/Architect (2003 - 2005), Senior Developer (2015). Managed projects across three international locations; designed a tiered simulation platform with a WCF message router, and an extensible CMS.
- **Roughneck Development and Data Fusion Technologies** - Principal and Senior Developer (2005 - 2008). Government and legal-industry web applications, and a municipal water pumping station kiosk with custom database replication.

## Independent Projects and Open Source

- **Cross-runtime database driver:** Building an ODBC database adapter in Rust over FFI for Node.js, Deno, and Bun.
- **Preservation and reverse engineering:** Reconstructed and published an open specification for a protocol whose vendor folded decades ago, coordinating with an independent implementer. Currently documenting a 29-year-old platform and using binary patching to get abandoned applications running again on current systems.
- **AI-assisted development, on personal projects:** PR creation and validation scripts, worktree conventions for parallel agent sessions, and a remote session manager with usage-aware throttling. Treats documentation and tests as the review surface for generated code, and human review capacity as the real limit on throughput.
- **Community:** Wrote an early JWT library for Node.js, before one was available on npm. Long-standing top-ranked StackOverflow contributor, active GitHub contributor, and maintainer of published npm packages.
