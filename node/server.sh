docker service create --replicas 2 --name node-server -p 3000:3000 --update-failure-action rollback  node-server:latest