## docker build
docker build --squash -t node-server:latest .
docker build --build-arg HHH=122 -t node-server:latest .

## docker run
docker run --rm -d -p 3000:3000 node-server