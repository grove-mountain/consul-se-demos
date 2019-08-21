service {
  name                = "cats"
  id                  = "cats-v1"
  enable_tag_override = false
  address             = "10.42.2.1"
  port                = 8080
  tags                = ["v1"]
  meta                = { version = "1" }
  checks  = [
    {
        id       = "cats-tcp-8080",
        name     = "Cats TCP on port 8080",
        tcp      = "10.42.2.1:8080",
        interval = "10s",
        timeout  = "1s"
    }
  ]
  connect = { 
    sidecar_service {
      port   = 21000
      checks = [
        {
          name     =  "Connect Sidecar Listening cats"
          tcp      = "10.42.2.1:21000"
          interval = "10s"
        },
        {
          name          = "Connect Sidecar Aliasing cats"
          alias_service = "cats"
        }
      ]
    }
  }
}
