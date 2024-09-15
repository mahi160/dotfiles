### Add portainer

- Create docker

```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.0
```

- Got to `https://localhost:9443`
- Login with with new credentials
- Go to stacks
- Add stacks
  - Give a name
  - Copy the content of `server/docker-compose.yml` and paste it in the editor. Comment any services if you don't need them.
  - Upload .env file by modifying the paths
- Deploy Stack

### My Stack

- _Jellyfin_: Media player like netflix. Url: `https://{host}:8096`
- _Transmission_: Torrent client. Url: `https://{host}:9091`
- _Jellyseer_: Request movie / series. Url: `https://{host}:5055`
- _Bazarr_: Auto download subtitles. Url: `https://{host}:6767`
- _Calibre-Web_: Read books online from calire. Url: `https://{host}:8083`
- _Calibre_: Books manager. Url: `https://{host}:8082`
- _Prowlarr_: Torrent urls setup. Url: `https://{host}:9696`
- _Radarr_: Auto movie manager. Url: `https://{host}:7878`
- _Sonarr_: Auto series. Url: `https://{host}:8989`
- _Duplicati_: Backups. Url: `https://{host}:8200`
- _Watchtower_: Docker auto updater. Url: `https://{host}:8080`
- _FlareSolverr_: DNS for torrents. Url: `https://{host}:8191`
- _AdGuard_: Network wide DNS Ad blocker. Url: `https://{host}:8088`
