# Configuration 

```yaml
  setter:
    restart: always
    image: gitlab.tunex.io:5050/digital-magic/setter
    volumes:
      - ../config/frontend/tower.js:/home/app/env.js
    labels:
      - "traefik.http.routers.setter-<%= @name %>.rule=Host(`<%= @config['app']['subdomain'] %>.<%= @config['app']['domain'] %>`) && PathPrefix(`/setter`)"
      - "traefik.enable=true"
      - "traefik.http.services.setter-<%= @name %>.loadbalancer.server.port=3000"
      <%- if @config['ssl']['enabled'] -%>
      - "traefik.http.routers.setter-<%= @name %>.entrypoints=websecure"
      - "traefik.http.routers.setter-<%= @name %>.tls=true"
      - "traefik.http.routers.setter-<%= @name %>.tls.certresolver=myresolver"
      <%- else -%>
      - "traefik.http.routers.setter-<%= @name %>.entrypoints=web"
      <%- end -%>

```

