param databricksWorkspaceName string = 'databricks${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
param sku string = 'trial'

var managedResourceGroupName = 'databricks-rg-${databricksWorkspaceName}-${uniqueString(databricksWorkspaceName, resourceGroup().id)}'

resource databricksWorkspaceName_resource 'Microsoft.Databricks/workspaces@2018-04-01' = {
  name: databricksWorkspaceName
  location: location
  sku: {
    name: sku
  }
  properties: {
    managedResourceGroupId: subscriptionResourceId('Microsoft.Resources/resourceGroups', managedResourceGroupName)
    authorizations: []
  }
}

output databricksWorkspaceName string = databricksWorkspaceName
output workspaceUrl string = databricksWorkspaceName_resource.properties.workspaceUrl
