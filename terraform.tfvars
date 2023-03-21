groups = {
  app_team    = "app-team"
  app_devs    = "app-devs"
  app_admins  = "app-admins"
  api_team    = "api-team"
  api_devs    = "api-devs"
  api_admins  = "api-admins"
  infra_team  = "infra-team"
  infra_devs  = "infra-devs"
  infra_admins= "infra-admins"
}

projects = {
  app = {
    name = "app"
    description = "Demo using AAD groups"
    team = "app"
  }
  api = {
    name = "api"
    description = "Demo using AAD groups"
    team = "api"
  }
  infra = {
    name = "infra"
    description = "Central IT Managed Infrastructure"
    team = "infra"
  }
}

environments = {
  app_dev = {
    env = "dev"
    team = "app"
  }
  app_prod = {
    env = "prod"
    team = "app"
  }
  api_dev = {
    env = "dev"
    team = "api"
  }
  api_prod = {
    env = "prod"
    team = "api"
  }
  infra_shared = {
    env = "shared"
    team = "infra"
  }
}

