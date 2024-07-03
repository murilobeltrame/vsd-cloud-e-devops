#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 -t Tag"
    exit 1
}

# Parse command line arguments
while getopts "t:" opt; do
    case $opt in
        t) TAG=$OPTARG ;;
        *) usage ;;
    esac
done

# Check if both parameters are provided
if [ -z "$TAG" ]; then
    echo "Error: Tag parameter is required."
    usage
fi

docker build --file ../backend/Dockerfile --tag $TAG ../backend/.
docker push $TAG
