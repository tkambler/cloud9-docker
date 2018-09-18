# Docker Image: tkambler/cloud9

A Docker image for the Cloud9 web IDE.

Start the container as shown below:

```
docker run -ti --rm -p 8000:80 -v /path/to/local/workspace:/root/workspace tkambler/cloud9
docker run --rm -p 8000:80 -v /Users/tkambler/temp/foo:/root/workspace tkambler/cloud9
```

- Cloud9 is exposed on port 80.
- The IDE opens the `/root` folder by default. An easy way to get started would be to mount a local folder into the `/root/workspace` folder as shown in this example.