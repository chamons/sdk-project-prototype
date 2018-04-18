install-nuget::
	cp nuget/bin/Debug/Sdk.Project.Prototype.1.0.0.nupkg ~/nuget/

nuget/bin/Debug/Sdk.Project.Prototype.1.0.0.nupkg:
	nuget restore nuget/Sdk.Project.Prototype.csproj
	msbuild nuget/Sdk.Project.Prototype.csproj

clean::
	msbuild nuget/Sdk.Project.Prototype.csproj /t:clean
