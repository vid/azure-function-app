#!/usr/bin/env -S bash -x

# based on https://docs.microsoft.com/en-ca/azure/azure-functions/functions-create-function-linux-custom-image?tabs=isolated-process%2Cbash%2Cazure-cli&pivots=programming-language-typescript

# Populate .env  before running this script.

source .env

if [ ! $PROJECT_BASE ]; then
  echo 'please env PROJECT_BASE, LOC, DOCKER_ID, IMAGE_NAME, IMAGE_TAG'
  exit 1;
fi

STORAGE_ACCOUNT=`echo ${PROJECT_BASE}-sa | sed 's/-/z/g'`

az login && \

az group create --name ${PROJECT_BASE}-rg --location ${LOC} && \
az storage account create --name ${STORAGE_ACCOUNT} --location ${LOC} --resource-group ${PROJECT_BASE}-rg --sku Standard_LRS && \

az functionapp plan create --resource-group ${PROJECT_BASE}-rg --name ${PROJECT_BASE}-asp --location ${LOC} --number-of-workers 1 --sku EP1 --is-linux && \

az functionapp create --name ${PROJECT_BASE}-app --storage-account ${STORAGE_ACCOUNT} --resource-group ${PROJECT_BASE}-rg --plan ${PROJECT_BASE}-asp --functions-version 3 --deployment-container-image-name ${DOCKER_ID}/${IMAGE_NAME}:${IMAGE_TAG} && \

O=`az storage account show-connection-string --resource-group ${PROJECT_BASE}-rg --name ${STORAGE_ACCOUNT}  --query connectionString --output tsv`
# the following may break if output order changes
SA_CONNECTION=`node -p -e "'${O}'.replace(/.*AccountKey=/, '')"`
az functionapp config appsettings set --name ${PROJECT_BASE}-app --resource-group ${PROJECT_BASE}-rg --settings AzureWebJobsStorage=${SA_CONNECTION}


