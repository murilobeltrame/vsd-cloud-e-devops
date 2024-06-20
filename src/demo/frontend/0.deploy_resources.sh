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

# Create a new resource group using Azure CLI
az group create \
    --name $RESOURCE_GROUP_NAME \
    --location $LOCATION

APP_NAME=$RESOURCE_GROUP_NAME"-staticwebapp"
az staticwebapp create \
    --name $APP_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --location $LOCATION \