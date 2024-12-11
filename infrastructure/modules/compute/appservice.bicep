param location string = resourceGroup().location
param appServicePlanName string
param appName string
param skuName string = 'F1'
param keyVaultName string
param appSettings array = []

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  kind: 'linux'
  location: location
  name: appServicePlanName
  properties: {
    reserved: true
  }
  sku: {
    name: skuName
  }
}

resource webApp 'Microsoft.Web/sites@2023-12-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|9.0'
      appSettings: concat(
        [
          {
            name: 'KeyVaultName'
            value: keyVaultName
          }
        ],
        appSettings
      )
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}

resource webAppConfig 'Microsoft.Web/sites/config@2023-12-01' = {
  parent: webApp
  name: 'web'
  properties: {
    scmType: 'GitHub'
  }
}

output appServiceId string = webApp.id
output principalId string = webApp.identity.principalId