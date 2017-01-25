# docker-sinusbot

[![](https://images.microbadger.com/badges/image/galexrt/sinusbot.svg)](https://microbadger.com/images/galexrt/sinusbot "Get your own image badge on microbadger.com")

[![Docker Repository on Quay.io](https://quay.io/repository/galexrt/sinusbot/status "Docker Repository on Quay.io")](https://quay.io/repository/galexrt/zulip)
* [**Quay.io**](https://quay.io/repository/galexrt/sinusbot)
* [**Docker Hub**](https://hub.docker.com/r/galexrt/sinusbot)

Debian Jessie with Sinusbot by Michael Friese.
TeamSpeak 3 SinusBot Homepage: https://frie.se/ts3bot/.

Current version:
```
Sinusbot: latest beta (>=0.9.16-10f0fad)
TeamSpeak: 3.0.19.4 (this version is required for Sinusbot)
```

## Summary
* Debian Jessie with the latest version of Sinusbot
* You can inject your data into the container
  * /data

## Usage
### Updating the image
Run the below command, to update the image to the latest version:
```
docker pull quay.io/galexrt/sinusbot:latest
```

### Permissions
The default UID of the user which is used in the container is 3000.
So if you mount a directory from your host you have to set the permission to the user with the UID of 3000.
```
useradd -u 3000 sinusbot
mkdir -p /opt/docker/sinusbot/data /opt/docker/sinusbot/scripts
chown -R sinusbot:sinusbot /opt/docker/sinusbot/data /opt/docker/sinusbot/scripts
```
Or if you dont want to create an user just use
```
mkdir -p /opt/docker/sinusbot/data /opt/docker/sinusbot/scripts
chown -R 3000:3000 /opt/docker/sinusbot
```
Or just use the built-in variables to the run command to change the user and/or group id to an existing or non existing user:
The variables need to be an user/group id not the username:
```
SINUS_USER=3000
SINUS_GROUP=3000
```

### Mount host directory
```
docker run \
    --name sinusbot \
    -d \
    -v /opt/docker/sinusbot/data:/sinusbot/data \
    -v /opt/docker/sinusbot/scripts:/sinusbot/scripts \
    -p 8087:8087 \
    galexrt/sinusbot:latest
```

### SELinux
If your host uses SELinux it may be necessary to use the **:z** option:
```
docker run \
    --name sinusbot \
    -d \
    -v /opt/docker/sinusbot/data:/sinusbot/data \
    -v /opt/docker/sinusbot/scripts:/sinusbot/scripts \
    -p 8087:8087 \
    galexrt/sinusbot:latest
```
