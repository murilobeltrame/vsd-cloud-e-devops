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

APP_NAME=$RESOURCE_GROUP_NAME"-staticwebapp"
DEPLOYMENT_TOKEN=$(az staticwebapp secrets list --name "$APP_NAME" --resource-group "$RESOURCE_GROUP" --query "properties.apiKey" --output tsv)

npx swa deploy \
    --deployment-token "$DEPLOYMENT_TOKEN" \
    --env production