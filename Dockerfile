# build wwwroot
FROM node:lts-slim AS frontend-build
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME/bin:$PATH"
RUN corepack enable
COPY . /app
WORKDIR /app
RUN --mount=type=cache,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS dotnet-build
COPY --from=frontend-build /app /app
WORKDIR /app
RUN dotnet restore "src/dotnet-web-react-vite-template.Web/dotnet-web-react-vite-template.Web.csproj"
RUN dotnet publish "src/dotnet-web-react-vite-template.Web/dotnet-web-react-vite-template.Web.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
EXPOSE 8080
WORKDIR /app
COPY --from=dotnet-build /app/publish .
ENTRYPOINT ["dotnet", "dotnet-web-react-vite-template.Web.dll"]
