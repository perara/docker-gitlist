# docker-gitlist
A dockerized version of gitlist

## Usage
```bash
docker run -d -v /path/to/gits:/git -p 8085:80 --name gitlist --restart always perara/docker-gitlist
```