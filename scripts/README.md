# Scripts and Code Snipppets

## Contents

## Retrieve Storage Account Access Key

- Requirements:
  - `azure-cli` - Azure Command Line Interface
  - `jq` - `JSON` CLI parsing tool
- Environment Variables:
  - `$AZ_RG_NAME` - resource group name
  - `$AZ_STORAGE_ACCOUNT_NAME` - storage account name

```bash
az storage account keys list --resource-group $AZ_RG_NAME --account-name $AZ_STORAGE_ACCOUNT_NAME | jq -r '.[0].value'
```
