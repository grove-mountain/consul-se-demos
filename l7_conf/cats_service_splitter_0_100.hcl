kind = "service-splitter"
name = "cats"
splits = [
  { 
    weight =  0
    service_subset = "v1"
  },
  { 
    weight =  100
    service_subset = "v2"
  }
]
