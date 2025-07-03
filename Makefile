all: up

up:
	@mkdir -p /home/maecarva/data/wp-files/
	@mkdir -p /home/maecarva/data/wp-db/
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

fclean:
	# docker volume rm -f `docker volume ls -q`
	docker images -q | xargs -r docker rmi -f
	# docker network rm -f `docker network ls -q`

.PHONY: all up down