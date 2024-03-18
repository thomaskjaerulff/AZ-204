# Create an Azure Container Registry
az group create --name az204-acr-rg --location NorthEurope

az acr create --resource-group az204-acr-rg \
    --name az204MyACR4593 --sku Basic

# Build and push image from a Dockerfile
echo FROM mcr.microsoft.com/hello-world > Dockerfile

az acr build --image sample/hello-world:v1  \
    --registry az204MyACR4593 \
    --file Dockerfile .

# Verify the results
az acr repository list --name az204MyACR4593 --output table

az acr repository show-tags --name az204MyACR4593 \
    --repository sample/hello-world --output table

# Run the image in the ACR
az acr run --registry az204MyACR4593 \
    --cmd '$Registry/sample/hello-world:v1' /dev/null

# Clean up resources
az group delete --name az204-acr-rg --no-wait