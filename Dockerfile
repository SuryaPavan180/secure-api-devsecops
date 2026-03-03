# Build stage
FROM mcr.microsoft.comdotnetsdk8.0 AS build
WORKDIR app
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Runtime stage
FROM mcr.microsoft.comdotnetaspnet8.0
WORKDIR app
COPY --from=build appout .
EXPOSE 8080
ENTRYPOINT [dotnet, SecureApi.dll]