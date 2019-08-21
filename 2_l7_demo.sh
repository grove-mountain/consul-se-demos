. env.sh

green "Set service defaults"
green "This updates the proxy configs to allow for HTTP routing of data by Envoy"
echo
cyan "Example Config"
pe "cat l7_conf/dogs_service_defaults.hcl"
pe "consul config write l7_conf/dogs_service_defaults.hcl"
pe "consul config write l7_conf/cats_service_defaults.hcl"
pe "consul config write l7_conf/rabbits_service_defaults.hcl"

green "Create service-resolver configs"
green "This creates labels to allow for routing of traffic to services based on some defining charactertic"
green "In this case we'll be switching based on application version using version meta data"
echo
cyan "Example Config"
pe 	"cat l7_conf/dogs_service_resolver.hcl"
pe 	"consul config write l7_conf/dogs_service_resolver.hcl"
pe 	"consul config write l7_conf/cats_service_resolver.hcl"
pe 	"consul config write l7_conf/rabbits_service_resolver.hcl"


green "Create service-splitter configs"
green "Using the service-resolver configs above, weight all traffic to V1"
echo
cyan "Example Config"
pe  "cat l7_conf/dogs_service_splitter_100_0.hcl"
pe  "consul config write l7_conf/dogs_service_splitter_100_0.hcl"
pe  "consul config write l7_conf/cats_service_splitter_100_0.hcl"
pe  "consul config write l7_conf/rabbits_service_splitter_100_0.hcl"
yellow "Now reload the webpage http://localhost:8000/layer4-connect/ several times and note the number of each animal shown in the picture"
yellow "You should see 1 of each animal only now"
p

green "Weight traffic to route services 50/50 between V1/V2"
echo
cyan "Example Config"
pe	"cat l7_conf/dogs_service_splitter_50_50.hcl" 
pe	"consul config write l7_conf/dogs_service_splitter_50_50.hcl" 
pe	"consul config write l7_conf/cats_service_splitter_50_50.hcl" 
pe	"consul config write l7_conf/rabbits_service_splitter_50_50.hcl" 
yellow "Now reload the webpage http://localhost:8000/layer4-connect/ several times and note the number of each animal shown in the picture"
yellow "You should see either 1 or 2 of each animal around half the time"
p

green "Set the services to route all to V2"
green "Weight traffic to route services completely to V2"
echo
cyan "Example Config"
pe "cat l7_conf/dogs_service_splitter_0_100.hcl"
pe "consul config write l7_conf/dogs_service_splitter_0_100.hcl"
pe "consul config write l7_conf/cats_service_splitter_0_100.hcl"
pe "consul config write l7_conf/rabbits_service_splitter_0_100.hcl"
yellow "Now reload the webpage http://localhost:8000/layer4-connect/ several times and note the number of each animal shown in the picture"
yellow "You should see 2 of each animal only now"
