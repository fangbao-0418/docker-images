docker run --rm -d --name mongo -p 27017:27017 -v /my/own/datadir:/data/db -e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
	-e MONGO_INITDB_ROOT_PASSWORD=secret \
mongo
