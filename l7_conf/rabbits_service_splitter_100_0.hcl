kind = "service-splitter"
name = "rabbits"
splits = [
  { 
    weight =  100
    service_subset = "v1"
  },
  { 
    weight =  0
    service_subset = "v2"
  }
]
