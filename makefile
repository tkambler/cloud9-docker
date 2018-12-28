all:
	docker build -t tkambler/cloud9 .

clean:
	docker rmi tkambler/cloud9
