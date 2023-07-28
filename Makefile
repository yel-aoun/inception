all: build
	@docker-compose -f ./srcs/docker-compose.yml up
re: fclean
	@docker-compose -f ./srcs/docker-compose.yml build --no-cache
build:
	@docker-compose -f ./srcs/docker-compose.yml build
down:
	@docker-compose -f ./srcs/docker-compose.yml down
fclean: down
	@docker system prune -a --force
	rm -rf /home/yel-aoun/data/base_data/* && rm -rf /home/yel-aoun/data/wp_data/*