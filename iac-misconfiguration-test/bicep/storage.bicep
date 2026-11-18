param location string = 'eastus'
resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'syntheticbicepstore'
  location: location
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
  // TESTCASE: IAC-010 Bicep storage account allows public blob access
  // TESTCASE: IAC-011 Bicep storage account does not enforce HTTPS and uses old TLS
  properties: {
    allowBlobPublicAccess: true
    supportsHttpsTrafficOnly: false
    minimumTlsVersion: 'TLS1_0'
  }
}
