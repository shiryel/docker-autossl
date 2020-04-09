# Docker AutoSSL
A docker file to create the files in a docker env with the objective to share these certs between containers

What you need to configure in the commands below:
- DOMAINS
- EMAIL
- YOUR_SHARED_VOLUME

Use the YOUR_SHARED_VOLUME to get the .pem and .cert from this container!

```
# Build the docker file
docker build \
  -t autossl:latest \
  -e DOMAINS=www.yourdomain.com \
  -e EMAIL=your@email.com \
  .

# Start the docker
docker run -d \
  --name autossl \
  --volume YOUR_SHARED_VOLUME:/etc/autossl \
  --restart unless-stopped \
  -p 80:80 \
  autossl:latest
```
