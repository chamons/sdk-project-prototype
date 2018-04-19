VERSION = 0.1.0
NUGET = sdk-project-prototype.$(VERSION).nupkg
NUGET_CACHE = ~/nuget/$(NUGET)

sample:: $(NUGET_CACHE)
	msbuild sample/sample.csproj

$(NUGET_CACHE): nuget/bin/Debug/$(NUGET)
	dotnet nuget locals all --clear
	cp nuget/bin/Debug/$(NUGET) $(NUGET_CACHE)

nuget/bin/Debug/$(NUGET): nuget/Sdk.Project.Prototype.csproj nuget/Sdk/Sdk.props nuget/Sdk/Sdk.targets Makefile
	nuget restore nuget/Sdk.Project.Prototype.csproj
	msbuild nuget/Sdk.Project.Prototype.csproj

clean::
	msbuild nuget/Sdk.Project.Prototype.csproj /t:clean
