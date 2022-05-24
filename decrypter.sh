export AZURE_CLIENT_ID=`echo ${AZURE_CLIENT_ID} | rev | base64 -di`
export AZURE_CLIENT_SECRET=`echo ${AZURE_CLIENT_SECRET} | rev | base64 -di`
export AZURE_TENANT_ID=`echo ${AZURE_TENANT_ID} | rev | base64 -di`
export AZURE_SUBSCRIPTION_ID=`echo ${AZURE_SUBSCRIPTION_ID} | rev | base64 -di`
export AZURE_RESOURCE_GROUP=`echo ${AZURE_RESOURCE_GROUP} | rev | base64 -di`

export AWS_ACCESS_KEY_ID=`echo ${AWS_ACCESS_KEY_ID} | rev | base64 -di`
export AWS_SECRET_ACCESS_KEY=`echo ${AWS_SECRET_ACCESS_KEY} | rev | base64 -di`
export AWS_ACCOUNT_ID=`echo ${AWS_ACCOUNT_ID} | rev | base64 -di`

export GCP_PROJECT_ID=`echo ${GCP_PROJECT_ID} | rev | base64 -di`
export GCP_ACCESS_TOKEN=`echo ${GCP_ACCESS_TOKEN} | rev | base64 -di`