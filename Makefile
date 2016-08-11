build:
	docker-compose build

run: build
	docker-compose up

release: build
	cat docker-compose.yml \
	| grep "registry.vivino.com" \
	| cut -d" " -f6 \
	| xargs -n1 docker push
