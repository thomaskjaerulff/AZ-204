# Develop Azure compute solutions

## Implement containerized solutions
Azure Container Registry (ACR) is a private Docker registry service to store your Docker container images.

|Tier|Description|
|-|-|
|**Basic**|Appropriate for lower usage scenarios. For developers learning about ACR|
|**Standard**|With increased included storage and image throughput|
|**Premium**|High-volume scenearios. Geo-replication with restricted access to registry|

Use Azure Container Registry Tasks (ACR Tasks) to streamline building, testing, pushing, and deploying images in Azure. 

You can use ACR without having a local version of Docker installed.

Azure CLI script to run container image using Azure Container Registry Tasks:

```Shell
# Create an Azure Container Registry
az group create --name az204-acr-rg --location NorthEurope

# Create the Azure Container Registry with a Basic tier
az acr create --resource-group az204-acr-rg --name az204myacr4593 --sku Basic

# Create Dockerfile
echo "FROM mcr.microsoft.com/hello-world" > Dockerfile

# Build and push image from a Dockerfile
az acr build --image sample/hello-world:v1 --registry az204myacr4593 --file Dockerfile .

# Verify the results
az acr repository list --name az204myacr4593 --output table

az acr repository show-tags --name az204myacr4593 --repository sample/hello-world --output table

# Run the image in the ACR
az acr run --registry az204myacr4593 --cmd '$Registry/sample/hello-world:v1' /dev/null

# Clean up resources
az group delete --name az204-acr-rg --no-wait
```

Azure Container Instances (ACI) offers a way to run containers in Azure. 

## Implement Azure App Service Web Apps

## Implement Azure Functions