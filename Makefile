include srcs/.env

build:
	cd srcs && docker-compose up --build

back_build:
	cd srcs && docker-compose up --build -d

down:
	cd srcs && docker-compose down

volume_clean:
	sudo rm -rf ${VOLUME_DIR_FROM_ROOT}/frontend ${VOLUME_DIR_FROM_ROOT}/db
	docker volume rm $$(docker volume ls -q)

image_clean:
	docker rmi $$(docker images -a -q)

clean:
	docker system prune -f

fclean: clean volume_clean image_clean

exec_mariadb:
	cd srcs && docker-compose exec mariadb /bin/ash

exec_wordpress:
	cd srcs && docker-compose exec wordpress /bin/ash

exec_nginx:
	cd srcs && docker-compose exec nginx /bin/ash

make_dir:
	sudo mkdir -p ${VOLUME_DIR_FROM_ROOT}/frontend
	sudo mkdir -p ${VOLUME_DIR_FROM_ROOT}/db

host_setting:
	sudo sed -e 's/127.0.0.1/127.0.0.1	${WP_URL}/' /etc/hosts > copy_hosts
	cp /etc/hosts ./origin_hosts
	sudo cp copy_hosts /etc/hosts

host_clean:
	sudo cp ./origin_hosts /etc/hosts

.PHONY: build back_build down volume_clean image_clean clean fclean exec_mariadb exec_wordpress exec_nginx make_dir host_setting host_clean
