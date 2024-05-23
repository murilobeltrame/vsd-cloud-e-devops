#!/bin/bash

RESOURCE_GROUP_NAME="my-resource-group"
LOCATION="westus"

if [ $# -gt 0 ]; then
    RESOURCE_GROUP_NAME=$1
    LOCATION=$2
fi

# Create a new resource group using Azure CLI
az group create \
    --name $RESOURCE_GROUP_NAME \
    --location $LOCATION

# Provision App Service Plan
APPSERVICE_PLAN_NAME=$RESOURCE_GROUP_NAME"-appserviceplan"
az appservice plan create \
    --name $APPSERVICE_PLAN_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --location $LOCATION \
    --sku F1  # Free tier

# Provision App Service
APPSERVICE_NAME=$RESOURCE_GROUP_NAME"-appservice"
az webapp create \
    --name $APPSERVICE_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --plan $APPSERVICE_PLAN_NAME \
    --runtime "dotnet:8"
    

# Provision Azure SQL Database
SQL_SERVER_NAME=$RESOURCE_GROUP_NAME"-sql-server"
SQL_SERVER_ADMIN_USER="AdminUser"
SQL_SERVER_ADMIN_PASSWORD=""
SQL_DATABASE_NAME=$RESOURCE_GROUP_NAME"-sql-db"
az sql server create \
    --name $SQL_SERVER_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --location $LOCATION \
    --admin-user $SQL_SERVER_ADMIN_USER \
    --admin-password $SQL_SERVER_ADMIN_PASSWORD

az sql db create \
    --name $SQL_DATABASE_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --server $SQL_SERVER_NAME \
    --edition Basic

# Output the resource group name for future reference
echo "Resource Group Name: $RESOURCE_GROUP_NAME"