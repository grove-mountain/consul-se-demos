service {
  name                = "rabbits"
  id                  = "rabbits-v1"
  enable_tag_override = false
  address             = "10.42.3.1"
  port                = 8080
  tags                = ["v1"]
  meta                = { version = "1" }

  checks  = [
    {
        id       = "rabbits-tcp-8080",
        name     = "Rabbits TCP on port 8080",
        tcp      = "10.42.3.1:8080",
        interval = "10s",
        timeout  = "1s"
    }
  ]

  connect = { 
    sidecar_service {
      port   = 21000
      checks = [
        {
          name     =  "Connect Sidecar Listening rabbits"
          tcp      = "10.42.3.1:21000"
          interval = "10s"
        },
        {
          name          = "Connect Sidecar Aliasing rabbits"
          alias_service = "rabbits"
        }
      ]
    }
  }
}
