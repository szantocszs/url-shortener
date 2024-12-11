# url-shortener
Let's Build It for Laba Azure Course

## Infrastructure as Code

### Download Azure CLI
https://learn.microsoft.com/en-us/cli/azure/

### Login to Azure
``` bash
az login
az login --tenant 27bc221f-8229-4a57-81c8-7861067ec95d

```

### Create Resource Group
``` bash
az group create --name laba-urlshortener-dev --location westeurope
```

### Delete Resource Group

``` bash
az group delete --name laba-urlshortener-dev
```

### Deploy bicep file into resource group

``` bash
az deployment group what-if --resource-group laba-urlshortener-dev --template-file main.bicep

az deployment group create --resource-group laba-urlshortener-dev --template-file main.bicep
```
resource groups\deployment where deployments in progress is visible


### Create User for GH Actions

``` bash
az ad sp create-for-rbac --name "GitHub-Actions-SP" \
                         --role contributor \
                         --scopes /subscriptions/28292e71-d9a7-48a7-81a2-526c30098a2a \
                         --sdk-auth


az ad sp create-for-rbac --name "GitHub-Actions-SP" \
                         --role contributor \
                         --scopes /subscriptions/b9f6f427-77d6-44c5-b71e-6369dda78728 \
                         --sdk-auth

az ad sp create-for-rbac --name "GitHub-Actions-SP" \
                         --role contributor \
                         --scopes /subscriptions/10470b33-dc43-4179-add5-c77972fa476c \
                         --sdk-auth

az ad sp create-for-rbac --name "GitHub-Actions-SP" \
                         --role contributor \
                         --scopes /subscriptions/10470b33-dc43-4179-add5-c77972fa476c \
                         --sdk-auth

-- Powershell-ben kell futtatni mert bash alól nem megy valamiért                         
az ad sp create-for-rbac --name "GitHub-Actions-SP" --role contributor --scopes /subscriptions/10470b33-dc43-4179-add5-c77972fa476c --sdk-auth
az ad sp create-for-rbac --name "GitHub-Actions-SP" --role contributor --scopes /subscriptions/28292e71-d9a7-48a7-81a2-526c30098a2a --sdk-auth

az account set --subscription 10470b33-dc43-4179-add5-c77972fa476c
```

#### Configure a federated identity credential on an app

https://learn.microsoft.com/en-gb/entra/workload-id/workload-identity-federation-create-trust?pivots=identity-wif-apps-methods-azp#configure-a-federated-identity-credential-on-an-app

## Get Azure Publish Profile

``` bash
dev
az webapp deployment list-publishing-profiles --name api-kjlcpthy3q5jk --resource-group laba-urlshortener-dev --xml
az webapp deployment list-publishing-profiles --name token-range-service-kjlcpthy3q5jk --resource-group laba-urlshortener-dev --xml

stg
az webapp deployment list-publishing-profiles --name api-imwkpvocw37vq --resource-group laba-urlshortener-stg --xml
az webapp deployment list-publishing-profiles --name token-range-service-imwkpvocw37vq --resource-group laba-urlshortener-stg --xml

prod


```


### Apply to Custom Contributor Role
``` bash
az ad sp create-for-rbac --name "GitHub-Actions-SP" --role infra_deploy --scopes /subscriptions/28292e71-d9a7-48a7-81a2-526c30098a2a --sdk-auth
```