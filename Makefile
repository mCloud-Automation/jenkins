
up:
	# Data persistency
	docker-compose down
	#sudo rm -rf /opt/PromStack/influxdb/
	docker-compose up -d
	docker-compose ps

live:
	netstat -ntulp
	# # quietly add a user without password
	# sudo adduser --quiet --disabled-password --shell /bin/bash --home /home/harry --gecos "User" harry
	# # set password
	# echo "harry:admin" | sudo chpasswd
	# nohup jprq http 80 -s=jenkins &
	# nohup jprq http 9443 -s=portui &

portainer:
	docker volume create portainer_data
	docker run -d -p 8000:8000 -p 9443:9443 --name portainer  -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data  cr.portainer.io/portainer/portainer-ce:2.9.3
	sudo netstat -ntulp
	jprq http 9443 -s=portui
