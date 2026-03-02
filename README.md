<img align="right" src="https://raw.github.com/cliffano/generator-makefile/main/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/generator-makefile/workflows/CI/badge.svg)](https://github.com/cliffano/generator-makefile/actions?query=workflow%3ACI)
[![Security Status](https://snyk.io/test/github/cliffano/generator-makefile/badge.svg)](https://snyk.io/test/github/cliffano/generator-makefile)
<br/>

Generator-Makefile
------------------

Generator-Makefile is a Makefile projects generator.

It provides the following components:

| Component | Description |
|-----------|-------------|
| makefile | Generate a Makefile project |

Usage
-----

Generate code generator project:

    make generate-makefile

This component will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for package names and project repo name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| Author URL | The author's website URL. |
| GitHub ID | The GitHub ID of the project repo. |

Move to the generated project directory:

    cd stage/makefile/

Configuration
-------------

| Key | Value |
|-----|-------|
| project_id | generator-makefile |
| project_name | Generator-Makefile |
| project_desc | Generator-Makefile is a Makefile projects generator |
| author_name | Cliffano Subagio |
| author_email | cliffano@gmail.com |
| github_id | cliffano |
| github_repo | generator-makefile |
