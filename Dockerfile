FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS builder
WORKDIR /build
# Copy all files
COPY ./src/ ./

RUN dotnet restore ZKEACMS.Article/ZKEACMS.Article.csproj
RUN dotnet publish ZKEACMS.Article/ZKEACMS.Article.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.Article
RUN dotnet restore ZKEACMS.FormGenerator/ZKEACMS.FormGenerator.csproj
RUN dotnet publish ZKEACMS.FormGenerator/ZKEACMS.FormGenerator.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.FormGenerator
RUN dotnet restore ZKEACMS.GlobalScripts/ZKEACMS.GlobalScripts.csproj
RUN dotnet publish ZKEACMS.GlobalScripts/ZKEACMS.GlobalScripts.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.GlobalScripts
RUN dotnet restore ZKEACMS.Message/ZKEACMS.Message.csproj
RUN dotnet publish ZKEACMS.Message/ZKEACMS.Message.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.Message
RUN dotnet restore ZKEACMS.Product/ZKEACMS.Product.csproj
RUN dotnet publish ZKEACMS.Product/ZKEACMS.Product.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.Product
RUN dotnet restore ZKEACMS.Redirection/ZKEACMS.Redirection.csproj
RUN dotnet publish ZKEACMS.Redirection/ZKEACMS.Redirection.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.Redirection
RUN dotnet restore ZKEACMS.SectionWidget/ZKEACMS.SectionWidget.csproj
RUN dotnet publish ZKEACMS.SectionWidget/ZKEACMS.SectionWidget.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.SectionWidget
RUN dotnet restore ZKEACMS.Shop/ZKEACMS.Shop.csproj
RUN dotnet publish ZKEACMS.Shop/ZKEACMS.Shop.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.Shop
RUN dotnet restore ZKEACMS.Sitemap/ZKEACMS.Sitemap.csproj
RUN dotnet publish ZKEACMS.Sitemap/ZKEACMS.Sitemap.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.Sitemap
RUN dotnet restore ZKEACMS.SiteSearch/ZKEACMS.SiteSearch.csproj
RUN dotnet publish ZKEACMS.SiteSearch/ZKEACMS.SiteSearch.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.SiteSearch
RUN dotnet restore ZKEACMS.StyleEditor/ZKEACMS.StyleEditor.csproj
RUN dotnet publish ZKEACMS.StyleEditor/ZKEACMS.StyleEditor.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.StyleEditor
RUN dotnet restore ZKEACMS.TemplateImporter/ZKEACMS.TemplateImporter.csproj
RUN dotnet publish ZKEACMS.TemplateImporter/ZKEACMS.TemplateImporter.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.TemplateImporter
RUN dotnet restore ZKEACMS.Updater/ZKEACMS.Updater.csproj
RUN dotnet publish ZKEACMS.Updater/ZKEACMS.Updater.csproj -c Release -o /app/wwwroot/Plugins/ZKEACMS.Updater
RUN dotnet restore ZKEACMS.WebHost/ZKEACMS.WebHost.csproj
RUN dotnet publish ZKEACMS.WebHost/ZKEACMS.WebHost.csproj -c Release -o /app

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=builder /app .
EXPOSE 80

ENV zkdb="server=mysql002;port=3306;user=root;password=root;database=ZKEACMS;"

ENTRYPOINT ["dotnet", "ZKEACMS.WebHost.dll"]
