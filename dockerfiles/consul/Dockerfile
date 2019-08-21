# FROM consul-dev:latest
FROM consul:1.6.0-rc1

FROM consul:latest
COPY --from=0 /bin/consul /usr/local/bin/consul

ENTRYPOINT ["docker-entrypoint.sh"]

# By default you'll get an insecure single-node development server that stores
# everything in RAM, exposes a web UI and HTTP endpoints, and bootstraps itself.
# Don't use this configuration for production.
CMD ["agent", "-dev", "-client", "0.0.0.0"]
