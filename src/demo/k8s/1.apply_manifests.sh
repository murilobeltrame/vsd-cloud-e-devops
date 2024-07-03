#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 -n Namespace -c ConnectionString"
    exit 1
}

# Parse command line arguments
while getopts "n:c:" opt; do
    case $opt in
        n) NAMESPACE=$OPTARG ;;
        c) CONNECTION_STRING=$OPTARG ;;
        *) usage ;;
    esac
done

# Check if both parameters are provided
if [ -z "$NAMESPACE" ] || [ -z "$CONNECTION_STRING" ]; then
    echo "Error: Both Namespace and ConnectionString parameters are required."
    usage
fi


kustomize edit set namespace $NAMESPACE
kustomize edit set secret backend-secrets --from-literal=CONNECTION_STRING=$CONNECTION_STRING

kubectl apply -k .