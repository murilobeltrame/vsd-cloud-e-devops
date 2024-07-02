#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 -g ResourceGroup -l Location"
    exit 1
}

# Parse command line arguments
while getopts "g:l:" opt; do
    case $opt in
        g) RESOURCE_GROUP_NAME=$OPTARG ;;
        l) LOCATION=$OPTARG ;;
        *) usage ;;
    esac
done

# Check if both parameters are provided
if [ -z "$RESOURCE_GROUP_NAME" ] || [ -z "$LOCATION" ]; then
    echo "Error: Both ResourceGroup and Location parameters are required."
    usage
fi

# Your script logic here
echo "ResourceGroup: $RESOURCE_GROUP_NAME"
echo "Location: $LOCATION"

NODE_COUNT=3
KUBERNETES_VERSION="1.21.2"

# Create a resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create an AKS cluster
AKS_NAME=$RESOURCE_GROUP_NAME"-aks"
az aks create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $AKS_NAME \
    --node-count $NODE_COUNT \
    --enable-addons monitoring

# Get the AKS credentials for kubectl
az aks get-credentials --resource-group $RESOURCE_GROUP_NAME --name $AKS_NAME

echo "AKS cluster '$AKS_NAME' in resource group '$RESOURCE_GROUP_NAME' created successfully."