FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /build
COPY src/ .

RUN dotnet restore ZKCMS.Article/ZKCMS.Article.csproj
RUN dotnet publish ZKCMS.Article/ZKCMS.Article.csproj -c Release -o /app



#FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
#ARG source
#WORKDIR /zkeacms
#EXPOSE 80
#COPY ${source:-bin/Release/PublishOutput} .
#ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
