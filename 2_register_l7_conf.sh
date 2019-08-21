. env.sh

green "Set service defaults"
pe "cat l7_conf/dogs_service_defaults.hcl"
pe "consul config write l7_conf/dogs_service_defaults.hcl"
pe "consul config write l7_conf/cats_service_defaults.hcl"
pe "consul config write l7_conf/rabbits_service_defaults.hcl"

green "Create resolver configs"
pe 	"cat l7_conf/dogs_service_resolver.hcl"
pe 	"consul config write l7_conf/dogs_service_resolver.hcl"
pe 	"consul config write l7_conf/cats_service_resolver.hcl"
pe 	"consul config write l7_conf/rabbits_service_resolver.hcl"

green "Set the services to route all to V1"
pe  "cat l7_conf/dogs_service_splitter_100_0.hcl"
pe  "consul config write l7_conf/dogs_service_splitter_100_0.hcl"
pe  "consul config write l7_conf/cats_service_splitter_100_0.hcl"
pe  "consul config write l7_conf/rabbits_service_splitter_100_0.hcl"

green "Set the services to route 50/50 between V1/V2"
pe	"cat l7_conf/dogs_service_splitter_50_50.hcl" 
pe	"consul config write l7_conf/dogs_service_splitter_50_50.hcl" 
pe	"consul config write l7_conf/cats_service_splitter_50_50.hcl" 
pe	"consul config write l7_conf/rabbits_service_splitter_50_50.hcl" 

green "Set the services to route all to V2"
pe "cat l7_conf/dogs_service_splitter_0_100.hcl"
pe "consul config write l7_conf/dogs_service_splitter_0_100.hcl"
pe "consul config write l7_conf/cats_service_splitter_0_100.hcl"
pe "consul config write l7_conf/rabbits_service_splitter_0_100.hcl"
