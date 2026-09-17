FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
# Parent Image

# Set the working directory inside the container
WORKDIR /src

# first dot mean your current project directory 
# second dot means the working directory inside the container
COPY . .   

# Restore the dependencies for the project
RUN dotnet restore

RUN dotnet build -c Release -o /app/build

RUN dotnet publish -c Release -o /app/publish

#------------------------------------------------------
# Runtime Stage 

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime	
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 8080
ENTRYPOINT ["dotnet", "MVCwithDocker.dll"]