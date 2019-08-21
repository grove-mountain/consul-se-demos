#FROM consul-dev:latest
FROM consul:1.6.0-rc1

FROM envoyproxy/envoy-alpine:v1.11.1
COPY --from=0 /bin/consul /bin/consul
COPY ./wait_for_consul.sh /wait_for_consul.sh
RUN chmod +x /wait_for_consul.sh
