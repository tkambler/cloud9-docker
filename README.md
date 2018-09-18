# Docker Image: tkambler/cloud9

A Docker image for the Cloud9 web IDE.

Start the container as shown below:

```
docker run --rm -p 8000:80 -v /path/to/local/workspace:/root/workspace tkambler/cloud9
```