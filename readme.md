# Consul SE Demos

The intent for this is to create a single dashboard for Consul Demos.   

## Prerequisites

- Docker
- Bash

## Setup

Clone this repo

```
git clone https://github.com/grove-mountain/consul-se-demos.git
cd consul-se-demos
```

Run Docker Compose

```
docker-compose up
```

All scripts use a tool called demo-magic which allows you to step through each command that's being run and pause where necessary.   

## Consul Template Demo


Run the following script:
```
1_consul_template_demo.sh
```

## Consul Layer 7 Demo
Run the following script:
```
2_l7_demo.sh
```
