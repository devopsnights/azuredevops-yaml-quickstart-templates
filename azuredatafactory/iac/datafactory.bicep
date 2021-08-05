
param dataFactoryName string = 'adf-template-bicep-gh'
param location string = resourceGroup().location
param environment string = 'development'



// @allowed([
//   'FactoryVSTSConfiguration'
//   'FactoryGitHubConfiguration'
// ])
param repositoryType string = 'FactoryGitHubConfiguration'
param projectName string  = 'Sandbox'
param repositoryName string = 'azuredevops-yaml-quickstart-templates'
param accountName string = 'devopsnights'
param collaborationBranch string = 'develop'
param rootFolder string = '/azuredatafactory/src'
param hostName string = ''

var azDevopsRepoConfiguration = {
  accountName: accountName
  repositoryName: repositoryName
  collaborationBranch: collaborationBranch
  rootFolder: rootFolder  
  type: repositoryType
  projectName: projectName
}

var gitHubRepoConfiguration = {
  accountName: accountName
  repositoryName: repositoryName
  collaborationBranch: collaborationBranch
  rootFolder: rootFolder  
  type: repositoryType
}

var repoConfiguration = (repositoryType == 'FactoryVSTSConfiguration') ? azDevopsRepoConfiguration : gitHubRepoConfiguration 

resource dataFactoryName_resource 'Microsoft.DataFactory/factories@2018-06-01' =  {
  name: dataFactoryName
  location: location
  // properties: {
  //   repoConfiguration: (environment == 'development') ? (repositoryType == 'FactoryVSTSConfiguration') ? azDevopsRepoConfiguration : gitHubRepoConfiguration : {}
  // }
  properties: (environment == 'development') ? repoConfiguration : {}
  
  identity: {
    type: 'SystemAssigned'
  }  
}
