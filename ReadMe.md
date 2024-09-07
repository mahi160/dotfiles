# How I setup my dotfiles

## Common Setup

## Server

### Docker Setup

#### Add portainer

- Create docker

```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.0
```

- Got to `https://localhost:9443`
- Login with with new credentials

#### Add Stacks

- Got to `https://localhost:9443`
