FROM alpine:3.5
RUN apk update
RUN apk add bash wget curl jq

RUN apk add ruby ruby-dev gcc make g++ musl-dev
RUN gem install json --no-ri --no-rdoc
RUN gem install cf-uaac --no-ri --no-rdoc

COPY om-alpine om-alpine

# To compile om for alpine
# docker run -i -t -v "$PWD":/omtool golang:1.7.4-alpine sh
# apk update
# apk add git
# go get github.com/rsamban/om
# cd src/github.com/rsamban/om/
# go build -o /omtool/om-alpine
