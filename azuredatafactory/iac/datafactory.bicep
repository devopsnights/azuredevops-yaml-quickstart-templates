
param dataFactoryName string = 'adf-template-bicep'
param location string = resourceGroup().location
param environment string = 'development'

param accountName string = 'wesleycamargo'
param collaborationBranch string = 'develop'
param rootFolder string = '/synapse/src'
param repositoryType string = 'FactoryVSTSConfiguration'
param projectName string  = 'Sandbox'
param repositoryName string = 'adf-template'

var repoConfiguration = {
  accountName: accountName
  repositoryName: repositoryName
  collaborationBranch: collaborationBranch
  rootFolder: rootFolder  
  type: repositoryType
  projectName: projectName
}

resource dataFactoryName_resource 'Microsoft.DataFactory/factories@2018-06-01' =  {
  name: dataFactoryName
  location: location
  properties: {
    repoConfiguration: (environment == 'development') ? repoConfiguration : {}
  }
  identity: {
    type: 'SystemAssigned'
  }  
}
