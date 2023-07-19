# github-org-analyzer

![GitHub last commit](https://img.shields.io/github/last-commit/rajkumardongre/github-org-analyzer)
![GitHub top language](https://img.shields.io/github/languages/top/rajkumardongre/github-org-analyzer)

A GitHub organization analyzer written in Fortran, utilizing the [`http-client`](https://github.com/fortran-lang/http-client) package.

This Fortran package provides procedures to analyze GitHub organizations and retrieve valuable information about their repositories. By leveraging the power of the `http-client` package, this analyzer fetches data from the GitHub API to generate insightful reports.

## Features

The `github-org-analyzer` package offers the following procedures:

* `analyze_github_organization`: Provides detailed information about all repositories within the organization.
* `get_top_active_repositories`: Retrieves information about the top active repositories within the organization.
* `get_top_starred_repositories`: Retrieves information about the top starred repositories within the organization.
* `get_most_used_repositories`: Retrieves information about the most used repositories within the organization.
* `get_contributor_from_repositories`: Retrieves information about the contributors of the organization's repositories.

## Prerequisites

To use the `github-org-analyzer` package, ensure you have the following dependencies installed:

* Fortran compiler
*  On Ubuntu, you need to install the curl development headers. Use the following command:
```bash
sudo apt install -y libcurl4-openssl-dev
```

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/github-org-analyzer.git
   ```

2. Compile the package using your fpm:

   ```bash
   cd github-org-analyzer
   fpm build
   fpm run
   ```

## Usage

To use the procedures provided by `github-org-analyzer`, follow these steps:

1. Import the package into your Fortran project:

   ```fortran
   use github_org_analyzer
   ```

2. Call the desired procedures to retrieve information about GitHub organizations and their repositories.

   ```fortran
   ! Analyze GitHub organization
   call analyze_github_organization("your-github-org")

   ! Get information about top active repositories
   call get_top_active_repositories("your-github-org")

   ! Get information about top starred repositories
   call get_top_starred_repositories("your-github-org")

   ! Get information about most used repositories
   call get_most_used_repositories("your-github-org")

   ! Get information about contributors from repositories
   call get_contributor_from_repositories("your-github-org", "org-repository")
   ```

## Contributing

Contributions are welcome! If you want to contribute to `github-org-analyzer`, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push your changes to your forked repository.
5. Open a pull request, describing your changes and their benefits.



Happy analyzing!