
param dataFactoryName string = 'adf-template-bicep'
param location string = resourceGroup().location
param environment string = 'development'



// @allowed([
//   'FactoryVSTSConfiguration'
//   'FactoryGitHubConfiguration'
// ])
param repositoryType string = 'FactoryVSTSConfiguration'
param projectName string  = 'Sandbox'
param repositoryName string = 'adf-template'
param accountName string = 'wesleycamargo'
param collaborationBranch string = 'develop'
param rootFolder string = '/datafactory/src'
param hostName string = ''



  


// var repoConfiguration = {
//   accountName: accountName
//   repositoryName: repositoryName
//   collaborationBranch: collaborationBranch
//   rootFolder: rootFolder  
//   type: repositoryType
//   (repositoryType == 'FactoryVSTSConfiguration'): _projectName: _hostName
// }

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


resource dataFactoryName_resource 'Microsoft.DataFactory/factories@2018-06-01' =  {
  name: dataFactoryName
  location: location
  properties: {
    repoConfiguration: (environment == 'development') ? (repositoryType == 'FactoryVSTSConfiguration') ? azDevopsRepoConfiguration : gitHubRepoConfiguration : {}
  }
  identity: {
    type: 'SystemAssigned'
  }  
}
