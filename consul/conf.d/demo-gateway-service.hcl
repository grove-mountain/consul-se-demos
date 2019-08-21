service {
  name    = "demo-gateway"
  id      = "demo-gateway"
  address = "10.42.0.10"
  port    = 8000
  tags    = ["v1"]
  meta    = { version = "1" } 

  checks  = [
    {
        id       = "demo-gateway-tcp-8000",
        name     = "Demo gateway TCP on port 8000",
        tcp      = "10.42.0.10:8000",
        interval = "10s",
        timeout  = "1s"
    }
  ]

  connect {
    sidecar_service {
      port = 20000

      checks = [
        {
          name     =  "Connect Sidecar Listening demo-gateway"
          tcp      = "10.42.0.10:20000"
          interval = "10s"
        },
        {
          name          = "Connect Sidecar Aliasing demo-gateway"
          alias_service = "demo-gateway"
        }
      ]

      proxy {
        upstreams = [
          {
            destination_name   = "dogs"
            local_bind_address = "127.0.0.1"
            local_bind_port    = 42100
          },
	  {
            destination_name = "cats"
            local_bind_address = "127.0.0.1"
            local_bind_port = 42200
          },
          {
            destination_name = "parrots"
            local_bind_address = "127.0.0.1"
            local_bind_port = 42300
          },
	  {
            destination_name = "rabbits"
            local_bind_address = "127.0.0.1"
            local_bind_port = 42400
          },
        ]
      }

    }
  }
}
