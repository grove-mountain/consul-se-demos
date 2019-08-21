kind = "service-resolver"
name = "dogs"
subsets = {
  "v1" = { filter =  "Service.Meta.version == 1" }
  "v2" = { filter =  "Service.Meta.version == 2" }
}

