// param location string = resourceGroup().id
var location = resourceGroup().location
var uniqueId = uniqueString(resourceGroup().id)

module appService 'modules/compute/appservice.bicep' = {
  name: 'apiDeployment'

  params: {
    appName: 'api-${uniqueId}'
    appServicePlanName: 'plan-api-${uniqueId}'
    location: location
  }
}
