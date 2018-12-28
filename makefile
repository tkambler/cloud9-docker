IMAGE=tkambler/cloud9

all:
	docker build -t $(IMAGE) .

clean:
	docker rmi $(IMAGE)
