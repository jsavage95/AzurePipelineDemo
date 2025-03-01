param (
    [string]$resourceGroupName = "HelloIOR-RG",
    [string]$location = "australiaeast",
    [string]$webAppName = "hello-ior-webapp-2025",
    [string]$appServicePlanName = "HelloIOR-Plan"
)

# Login to Azure (handled by Azure DevOps service connection)
# Create Resource Group
az group create --name $resourceGroupName --location $location

# Create App Service Plan (Free tier for cost-efficiency)
az appservice plan create --name $appServicePlanName --resource-group $resourceGroupName --location $location --sku F1

# Create Web App
az webapp create --name $webAppName --resource-group $resourceGroupName --plan $appServicePlanName

# Output Web App URL for reference
Write-Output "Web App URL: https://$webAppName.azurewebsites.net"