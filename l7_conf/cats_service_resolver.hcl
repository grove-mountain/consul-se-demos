kind = "service-resolver"
name = "cats"
subsets = {
  "v1" = { filter =  "Service.Meta.version == 1" }
  "v2" = { filter =  "Service.Meta.version == 2" }
  "v3" = { filter =  "Service.Meta.version == 3" }
  "v4" = { filter =  "Service.Meta.version == 4" }
}

