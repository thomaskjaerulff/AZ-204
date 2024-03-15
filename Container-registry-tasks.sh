# Create an Azure Container Registry
az group create --name az204-acr-rg --location NorthEurope

az acr create --resource-group az204-acr-rg \
    --name <myContainerRegistry> --sku Basic

# Build and push image from a Dockerfile
echo FROM mcr.microsoft.com/hello-world > Dockerfile

az acr build --image sample/hello-world:v1  \
    --registry <myContainerRegistry> \
    --file Dockerfile .

# Verify the results
az acr repository list --name <myContainerRegistry> --output table

az acr repository show-tags --name <myContainerRegistry> \
    --repository sample/hello-world --output table

# Run the image in the ACR
az acr run --registry <myContainerRegistry> \
    --cmd '$Registry/sample/hello-world:v1' /dev/null

# Clean up resources
az group delete --name az204-acr-rg --no-wait