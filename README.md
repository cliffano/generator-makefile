<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/cliffano/generator-makefile/workflows/CI/badge.svg)](https://github.com/cliffano/generator-makefile/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-makefile/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-makefile/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-makefile/badge.svg)](https://snyk.io/test/github/cliffano/generator-makefile)
<!-- END:BADGES -->

# Generator-Makefile

Generator-Makefile is a Makefile projects generator.

It provides the following components:

| Component | Description |
|-----------|-------------|
| makefile | Generate a Makefile project |

## Usage

Generate code generator project:

```shell
make generate-makefile
```

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

## Usage With Config File

Each component also has a `-with-config` target that skips the interactive prompts by reading the inputs from a Makeroo YAML config file. See [examples/](examples/) for sample config files for each component.

Pass the config file path via the `GENERATOR_CONFIG` variable, it defaults to `makeroo.yml`:

```shell
make generate-makefile-with-config GENERATOR_CONFIG=path/to/makeroo.yml
make generate-makefile-partials-with-config GENERATOR_CONFIG=path/to/makeroo.yml
```

Move to the generated project directory:

```shell
cd stage/makefile/
```

## Configuration

| Key | Value |
|-----|-------|
| project_id | generator-makefile |
| project_name | Generator-Makefile |
| project_desc | Generator-Makefile is a Makefile projects generator |
| author_name | Cliffano Subagio |
| author_email | cliffano@gmail.com |
| github_id | cliffano |
| github_repo | generator-makefile |

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://cliffano.github.io/developers-guide-makefile.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
Build reports:

<!-- END:BUILD_REPORTS -->
