ECS_LOGIN=$(shell aws ecr get-login --region us-east-1)

build:
        docker-compose build

run: build
        docker-compose up

release: build
        @$(ECS_LOGIN)
        cat docker-compose.yml | grep "492946569230.dkr.ecr.us-east-1.amazonaws.com" |  cut -d" " -f6 | xargs -n1 docker push
