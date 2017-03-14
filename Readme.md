# Alpine Teamspeak3
A dockerfile for running a Teamspeaak 3 server on Alpine Linux

## Volumes
This container requires a volumes mounted at `/data`

## docker-compose
An example docker-compose file for running the container can be found below:
```
version: '2'
services:
 teamspeak:
  image: adamant/teamspeak3
  volumes:
   - /volumes/teamspeak:/data
  ports:
   - "9987:9987/udp"
   - "10011:10011"
   - "30033:30033"
  restart: always```
