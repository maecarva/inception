all: up

up:
	@mkdir -p /home/maecarva/data/wp-files/
	@mkdir -p /home/maecarva/data/wp-db/
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

fclean:
	docker images -q | xargs -r docker rmi -f
	docker volume rm -f `docker volume ls -q`

ls:
	docker image ls
	docker container ls
	docker network ls
	docker volume ls
	docker ps -a

vrm:
	sudo rm -rf /home/maecarva/data/wp-files/
	sudo rm -rf /home/maecarva/data/wp-db/


re: down fclean all
	

.PHONY: all up down re