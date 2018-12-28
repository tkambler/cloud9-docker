# tkambler/cloud9

A Docker image for the Cloud9 web IDE.

## Usage

Start the container as shown below:

```
docker run -ti --rm -p 8000:80 -v /path/to/local/workspace:/root/workspace tkambler/cloud9
```

- Cloud9 is exposed on port 80.
- The IDE opens the `/root` folder by default. An easy way to get started would be to mount a local folder into the `/root/workspace` folder as shown in this example.

## Development

Build the image by running: `make`
