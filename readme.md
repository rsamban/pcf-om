## Docker file for PCF install/upgrade automation
```
$ docker build .
$ docker tag <IMAGE_ID> rsamban/pcf-om:1.0
$ docker push rsamban/pcf-om:1.0
```
The `Dockerfile` uses om-alpine binary to communicate with ops manager. Following are the steps to create the binary

```
	$ docker pull golang:1.7.4-alpine
	$ docker run -it -v "$PWD":/omtool sh
Following commands are executed inside docker container
	# apk update
	# apk add git
	# go get github.com/pivotal-cf/om
	# cd /go/src/github.com/pivotal-cf/om
	# go build -o /omtool/om-alpine
	# exit
The om-alpine binary will be available in the current working directory
``` 
