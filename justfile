set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

NAMESPACE := "DotMH" # The namespace for the project
LIB_POSTFIX := "Lib" # The postfix for the library project

NO_POSTFIX := "" # A constant to represent no postfix DO NOT EDIT

# Initialize a new project with a console app, library, and tests
init-console NAME: (init-project NAME) (init-library NAME) (init-console-app NAME) && init-github-actions
    dotnet add {{NAMESPACE}}.{{NAME}} reference {{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}

# Initialize a new solution and gitignore
init-project NAME:
    dotnet new gitignore
    dotnet new sln -n {{NAMESPACE}}.{{NAME}}

# Initialize a new library with tests
init-library NAME: && (_init-tests NAME LIB_POSTFIX)
    mkdir -p ./{{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}
    dotnet new classlib -n {{NAMESPACE}}.{{NAME}}lib -o ./{{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}
    dotnet sln add {{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}

# Initialize a new console app with test
init-console-app NAME: && (_init-tests NAME)
    mkdir -p ./{{NAMESPACE}}.{{NAME}}
    dotnet new console -n {{NAMESPACE}}.{{NAME}} -o ./{{NAMESPACE}}.{{NAME}}
    dotnet sln add {{NAMESPACE}}.{{NAME}}

# Creates a github actions workflow for dotnet
init-github-actions:
    mkdir -p .github/workflows
    cp templates/dotnet.yml .github/workflows/dotnet.yml

# Initialize tests for a project
_init-tests NAME POSTFIX=NO_POSTFIX:
    mkdir -p ./{{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests
    dotnet new xunit -n {{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests -o ./{{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests
    dotnet sln add {{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests
    dotnet add {{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests reference {{NAMESPACE}}.{{NAME}}{{POSTFIX}}
