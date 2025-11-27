set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

NAMESPACE := "DotMH" # The namespace for the project
LIB_POSTFIX := "Lib" # The postfix for the library project
TEST_POSTFIX := "Tests" # The postfix for the test library projects
API_POSTFIX := "Api" # The postfix for Web Api projects

NO_POSTFIX := "" # A constant to represent no postfix DO NOT EDIT

# Initialize a new solution with a console app, library, and tests
[group('New Solutions')]
init-console-sln NAME: (init-sln NAME) (init-library NAME) (init-console-app NAME) && init-github-actions
    dotnet add {{NAMESPACE}}.{{NAME}} reference {{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}

# Initialize a new solution wih a Web Api, library and tests
[group('New Solutions')]
init-webapi-sln NAME: (init-sln NAME) (init-library NAME) (init-webapi-app NAME) && init-github-actions
    dotnet add {{NAMESPACE}}.{{NAME}}{{API_POSTFIX}} reference {{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}

# Initialize a new solution wih a library and tests
[group('New Solutions')]
init-library-sln NAME: (init-sln NAME) (init-library NAME) && init-github-actions

# Initialize a new solution with a GUI app based on Avalonia and tests (based on Avalonia[https://avaloniaui.net])
[group('New Solutions')]
init-gui-sln NAME: (init-sln NAME) (init-library NAME) && init-github-actions
    dotnet add {{NAMESPACE}}.{{NAME}} reference {{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}

# Initialize a new solution and gitignore
[group('New Solutions')]
init-sln NAME:
    dotnet new gitignore
    dotnet new sln -n {{NAMESPACE}}.{{NAME}}

# Initialize a new library with tests
[group('New Projects')]
init-library NAME: && (_init-tests NAME LIB_POSTFIX)
    mkdir -p ./{{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}
    dotnet new classlib -n {{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}} -o ./{{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}
    dotnet sln add {{NAMESPACE}}.{{NAME}}{{LIB_POSTFIX}}

# Initialize a new console app with tests
[group('New Projects')]
init-console-app NAME: && (_init-tests NAME)
    mkdir -p ./{{NAMESPACE}}.{{NAME}}
    dotnet new console -n {{NAMESPACE}}.{{NAME}} -o ./{{NAMESPACE}}.{{NAME}}
    dotnet sln add {{NAMESPACE}}.{{NAME}}

# Initialize a new web api app with tests
[group('New Projects')]
init-webapi-app NAME: && (_init-tests NAME API_POSTFIX)
    mkdir -p ./{{NAMESPACE}}.{{NAME}}{{API_POSTFIX}}
    dotnet new webapi -n {{NAMESPACE}}.{{NAME}}{{API_POSTFIX}} -o ./{{NAMESPACE}}.{{NAME}}{{API_POSTFIX}} 
    dotnet sln add {{NAMESPACE}}.{{NAME}}{{API_POSTFIX}}

# Initialize a new Gui app (based on Avalonia[https://avaloniaui.net])
[group('New Projects')]
init-gui-app NAME: && (_init-tests NAME)
    mkdir -p ./{{NAMESPACE}}.{{NAME}}
    dotnet new avalonia.mvvm -n {{NAMESPACE}}.{{NAME}} -o ./{{NAMESPACE}}.{{NAME}}
    dotnet sln add {{NAMESPACE}}.{{NAME}}

# Show the task list when a users runs just help
[group('Helpers')]
help:
    just -l

# Creates a github actions workflow for dotnet
[group('Helpers')]
init-github-actions:
    mkdir -p .github/workflows
    cp templates/dotnet.yml .github/workflows/dotnet.yml

# Initialize tests for a project
_init-tests NAME POSTFIX=NO_POSTFIX:
    mkdir -p ./{{NAMESPACE}}.{{NAME}}{{POSTFIX}}{{TEST_POSTFIX}}
    dotnet new xunit -n {{NAMESPACE}}.{{NAME}}{{POSTFIX}}{{TEST_POSTFIX}} -o ./{{NAMESPACE}}.{{NAME}}{{POSTFIX}}{{TEST_POSTFIX}}
    dotnet sln add {{NAMESPACE}}.{{NAME}}{{POSTFIX}}{{TEST_POSTFIX}}
    dotnet add {{NAMESPACE}}.{{NAME}}{{POSTFIX}}{{TEST_POSTFIX}} reference {{NAMESPACE}}.{{NAME}}{{POSTFIX}}
