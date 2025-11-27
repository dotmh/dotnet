![DotMH](https://github.com/dotmh/dotmh/raw/master/dotnet-logo.png)

# DotMH DotNet C# Template

![.Net](https://img.shields.io/badge/.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white)
![C#](https://img.shields.io/badge/c%23-%23239120.svg?style=for-the-badge&logo=csharp&logoColor=white)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-%23FE5196?style=for-the-badge&logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=for-the-badge&)](https://opensource.org/licenses/Apache-2.0)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg?style=for-the-badge&)](code_of_conduct.md)

## Introduction

This is a template project for me to build C# projects with while I am learning and automates some of the dotnet tooling

> [!WARNING]
> To make use of this template you will need to have installed [Just](https://just.systems/man/en/introduction.html), as well as the
> [DotNet](https://dotnet.microsoft.com/en-us/download) Toolchain

### Getting Started:

1. Create a new repo from this
   [template in github](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
2. Clone the repo to your local machine
3. [Optional] Change the namespace in the Justfile to your namespace
4. run the command `just init-console {{Project Name}}` i.e. `just init-console MyApp`

## Just Constants

- NAMESPACE : The namespace to use when creating projects (default: DotMH)
- LIB_POSTFIX : The postfix to append to library project names (default: Lib)
- TEST_POSTFIX : The postfix to append to Test project names (default: Tests)
- API_POSTFIX : The postfix to append to API project names (default: Api)

## Just Commands

To see a list of the available Just commands run `just -l` or `just help`

### init-sln

Creates a new solution using NAME, this is done by adding a `gitignore` and a `solution`

```bash
just init-sln MyProject
```

#### Params

- NAME : The name (without) the namespace to give your solution

### init-library

Creates a new C# class library with the name `{{NAMEPACE}}.{{NAME}}{{LIB_POSTFIX}}`. It will also create a
test project named `{{NAMEPACE}}.{{NAME}}{{LIB_POSTFIX}}Tests`. The new project will be added to the solution

#### Example

```bash
just init-library MyLibrary
```

#### Params

- NAME : The name (without) the namespace to give your library, it will be given the post fix defined in LIB

### init-libray-sln

Creates a new complete Library Solution, with the name `{{NAMEPACE}}.{{NAME}}`. It will generate

- A solution
- A Library
- Tests for the Library
- Link it all together in the solution.

#### Example

```bash
just init-library-sln MyLibrary
```

#### Params

- NAME: The name (without) the namespace to give a library solution

### init-console-app

Create a new Command Line (Console) app, with the name `{{NAMEPACE}}.{{NAME}}`. It will also create a
test project named `{{NAMEPACE}}.{{NAME}}Test`. The new project will be added to the solution

#### Example

```bash
just init-console-app MyApp
```

#### Params

- NAME: The name (without) the namespace to give a command line (console) app

### init-console-sln

Creates a new complete Command Line (Console) Solution, with the name `{{NAMEPACE}}.{{NAME}}`. It will generate

- A solution
- A Console App
- A Library
- Tests for the Console App
- Tests for the Library
- Link it all together in the solution.

#### Example

```bash
just init-console-sln MyApp
```

#### Params

- NAME: The name (without) the namespace to give a command line (console) solution

### init-webapi-app

Create a new Web Api (webapi) app, with the name `{{NAMEPACE}}.{{NAME}}`. It will also create a
test project named `{{NAMEPACE}}.{{NAME}}Test`. The new project will be added to the solution

#### Example

```bash
just init-webapi-app MyApi
```

#### Params

- NAME: The name (without) the namespace to give a Web Api (webapi) app

### init-webapi-sln

Creates a new complete Web Api solution, with the name `{{NAMEPACE}}.{{NAME}}`. It will generate

- A solution
- A Web Api App
- A Library
- Tests for the Web Api App
- Tests for the Library
- Link it all together in the solution.

#### Example

```bash
just init-webapi-sln MyAPI
```

#### Params

- NAME: The name (without) the namespace to give a Web Api (webapi) solution

### init-gui-app

Creates a GUI Application based on Avalonia <https://avaloniaui.net/> using the MVVM template

Note if the template isn't already installed, it will install it first.

#### Example

```bash
just init-gui-app MyGuiApp
```

#### Params

- NAME: The name (without) the namespace to give a Gui App (avalonia.mvvm) project

### init-gui-sln

Creates a GUI Application Solution based on Avalonia <https://avaloniaui.net/> using the MVVM template

Note if the template isn't already installed, it will install it first.

- A solution
- A Gui App
- A Library
- Tests for the Gui App
- Tests for the Library
- Link it all together in the solution.

#### Example

```bash
just init-gui-sln MyGuiApp
```

#### Params

- NAME: The name (without) the namespace to give a Gui App (avalonia.mvvm) solution

## License

This repo is set up with an [Apache 2.0](https://opensource.org/license/apache-2-0) license and this will carry over to any projects that are
generated from the template unless you remove it.
