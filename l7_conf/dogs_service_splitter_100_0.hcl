kind = "service-splitter"
name = "dogs"
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
