export AZURE_CLIENT_ID=`echo ${AZURE_CLIENT_ID} | base64 -di`
export AZURE_CLIENT_SECRET=`echo ${AZURE_CLIENT_SECRET} | base64 -di`
export AZURE_TENANT_ID=`echo ${AZURE_TENANT_ID} | base64 -di`
export AZURE_SUBSCRIPTION_ID=`echo ${AZURE_SUBSCRIPTION_ID} | base64 -di`