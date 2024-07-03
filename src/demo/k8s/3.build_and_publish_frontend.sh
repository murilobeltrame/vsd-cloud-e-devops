#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 -t Tag -a ApiBaseUrl"
    exit 1
}

# Parse command line arguments
while getopts "t:a:" opt; do
    case $opt in
        t) TAG=$OPTARG ;;
        a) API_BASE_URL=$OPTARG ;;
        *) usage ;;
    esac
done

# Check if both parameters are provided
if [ -z "$TAG" ] || [ -z "$API_BASE_URL" ]; then
    echo "Error: Both Tag and ApiBaseUrl parameters are required."
    usage
fi

docker build --buil-arg API_BASE_URL=$API_BASE_URL --file ../frontend/Dockerfile --tag $TAG ../frontend/.
docker push $TAG
