NAMESPACE := "DotMH"
NO_POSTFIX := ""
LIB_POSTFIX := "Lib"

# Initialize a new project with a console app, library, and tests
init-console NAME: (init-project NAME) (init-library NAME) (init-console-app NAME)
    dotnet add {{NAMESPACE}}.{{NAME}} reference {{NAMESPACE}}.{{NAME}}lib

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

# Initialize tests for a project
_init-tests NAME POSTFIX=NO_POSTFIX:
    mkdir -p ./{{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests
    dotnet new xunit -n {{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests -o ./{{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests
    dotnet sln add {{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests
    dotnet add {{NAMESPACE}}.{{NAME}}{{POSTFIX}}Tests reference {{NAMESPACE}}.{{NAME}}{{POSTFIX}}