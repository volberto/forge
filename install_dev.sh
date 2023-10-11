#!/usr/bin/env bash
{

remove_progs(){
	sudo apt update
	sudo apt -y upgrade 
	sudo apt -y dist-upgrade
	sudo apt -y --fix-broken install
	sudo apt -y autoremove

	sudo apt -y remove --purge cheese
	sudo apt -y remove --purge gnome-sudoku
	sudo apt -y remove --purge gnome-mahjongg
	sudo apt -y remove --purge aisleriot
	sudo apt -y remove --purge gnome-mines 
	sudo apt -y remove --purge transmission*
	sudo apt -y remove --purge shotwell
	sudo apt -y remove --purge gnome-calendar
	sudo apt -y remove --purge rhythmbox
	sudo apt -y remove --purge thunderbird
	sudo apt -y remove --purge remmina
        sudo apt -y remove --purge libreoffice*
        sudo apt -y remove --purge simple-scan*
	sudo apt -y remove --purge gnome-calculator
	sudo apt -y remove --purge totem*
	sudo apt -y remove --purge gnome-power-manager
	sudo apt -y remove --purge gnome-todo*

	sudo apt -y autoremove
	sudo apt --fix-broken install

}



install_pack() {
	sudo apt update
	sudo apt -y upgrade 
	sudo apt -y dist-upgrade
	sudo apt --fix-broken install

	sudo apt -y install software-properties-common
	sudo apt -y install curl git npm

	sudo apt -y install telegram-desktop

	sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
	sudo apt-get update
	sudo apt -y install google-chrome-stable

	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install code



	echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
	wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install dbeaver-ce



	#abrir navegador na pg do GIT(Criar Usuario)
	google-chrome https://git.eagletrack.com.br/ &

}



install_PHP() {
	sudo add-apt-repository ppa:ondrej/php -y
	sudo apt-get update
	sudo apt -y install php7.4
	# php -v

	#definir linha de comando com o PHP7
	sudo update-alternatives --set php /usr/bin/php7.4


	#instalando dependencias
	sudo apt -y install php7.4-pgsql
	sudo apt -y install php7.4-xml
	sudo apt -y install php7.4-gd
	sudo apt -y install php7.4-mbstring
	sudo apt -y install php7.4-zip
	sudo apt -y install php-cli unzip
	sudo apt -y install php7.4-curl
	sudo apt -y install wkhtmltopdf

}


git_repositorio() {
	#Criar a pasta workspace na pasta do <user>/Documents
	cd $HOME/Documentos/
	sudo mkdir workspace
	sudo chmod 777 workspace
	cd $HOME/Documentos/workspace/

	#repositorio backend
	git clone https://git.eagletrack.com.br/track-web/track-backend.git

	#repositorio frontend
	git clone https://git.eagletrack.com.br/track-web/track-frontend.git

}


cria_pasta(){
	#cria pasta pdf (Requisito ao backend)
	cd $HOME/Documentos/workspace/track-backend/public/
	sudo mkdir pdf
	sudo chmod 777 pdf

	#cria pasta pdf (Requisito ao frontend)
	cd $HOME/Documentos/workspace/track-frontend/public/
	sudo mkdir pdf
	sudo chmod 777 pdf

}


#baixar e instalar o composer 2.5.0
install_COMPOSER() {
	cd $HOME/
	curl -sS https://getcomposer.org/installer -o composer-setup.php
	sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer 
	sudo composer self-update 2.5.0
	#composer -v
	rm -r $HOME/composer-setup.php
}


#gerar o .env
gera_env(){
	cd $HOME/Documentos/workspace/track-backend/
	
	if [ -e .env ]
	then
		rm -r .env
	fi

	echo ' APP_ENV=local ' >> .env
	echo ' APP_KEY=base64:vn/LP7yabP0Auymk7WYq/rI+wu5O7X1tDjpESuk0on4=' >> .env
	echo ' APP_DEBUG=true' >> .env
	echo ' APP_LOG_LEVEL=debug' >> .env
	echo ' APP_URL=http://localhost:8000' >> .env
	echo ' # Banco ACER' >> .env
	echo ' DB_CONNECTION=pgsql' >> .env
	echo ' #DB_HOST=192.168.1.200' >> .env
	echo ' DB_HOST=168.232.41.43' >> .env
	echo ' DB_PORT=5432' >> .env
	echo ' DB_DATABASE=eaglelaravel2' >> .env
	echo ' DB_USERNAME=postgres' >> .env
	echo ' DB_PASSWORD="eagle@2020#"' >> .env
	echo ' BROADCAST_DRIVER=log' >> .env
	echo ' CACHE_DRIVER=file' >> .env
	echo ' SESSION_DRIVER=file' >> .env
	echo ' QUEUE_DRIVER=sync' >> .env
	echo ' REDIS_HOST=127.0.0.1' >> .env
	echo ' REDIS_PASSWORD=null' >> .env
	echo ' REDIS_PORT=6379' >> .env
	echo ' #MAIL_DRIVER=smtp' >> .env
	echo ' #MAIL_HOST=smtp.gmail.com' >> .env
	echo ' #MAIL_PORT=587' >> .env
	echo ' #MAIL_USERNAME=eagle@eagletrack.com.br' >> .env
	echo ' #MAIL_PASSWORD=boladeneve2019#' >> .env
	echo ' #MAIL_ENCRYPTION=tls' >> .env
	echo ' MAIL_DRIVER=smtp' >> .env
	echo ' MAIL_HOST=smtp.mailtrap.io' >> .env
	echo ' MAIL_PORT=2525' >> .env
	echo ' MAIL_USERNAME=f5ceed1b253411' >> .env
	echo ' MAIL_PASSWORD=12f29b434b8cd4' >> .env
	echo ' MAIL_ENCRYPTION=null' >> .env
	echo ' PUSHER_APP_ID=' >> .env
	echo ' PUSHER_APP_KEY=' >> .env
	echo ' PUSHER_APP_SECRET=' >> .env
	echo ' JWT_SECRET=Ugd6JKo9MtRWYxBppcH4uAoSNFhFS0OoOBYnrwDRK0RC7LgnO2imlErh1hjDvazO' >> .env
	echo ' NOMINATIM_SERVER = "http://nominatim.eagletrack.com.br" # IP de rede privada' >> .env
	echo ' OSRM_SERVER = "http://osrm.eagletrack.com.br"' >> .env

}





#baixar e instalar o Laravel
install_LARAVEL_require() {
	cd $HOME/Documentos/workspace/track-backend/
	composer global require laravel/installer
	composer install
}

install_LARAVEL_passport() {
	cd $HOME/Documentos/workspace/track-backend/
	composer require laravel/passport=~8.2
}

php_artisan_passport() {

	cd $HOME/Documentos/workspace/track-backend/
	php artisan passport:install --force


	if [ -e $HOME/Documentos/workspace/track-backend/storage/oauth-public.key ]
	then
		echo "Gerando arquivo oauth-public.key "
		cd $HOME/Documentos/workspace/track-backend/
		php artisan passport:install --force
	else
		echo "Gerando arquivo oauth-public.key"
		cd $HOME/Documentos/workspace/track-backend/
		php artisan passport:install --force
	fi


}

php_artisan_key() {
	cd $HOME/Documentos/workspace/track-backend/
	php artisan key:generate
}

php_artisan_storage() {
	cd $HOME/Documentos/workspace/track-backend/
	php artisan storage:link
}


download_frontend(){
	cd $HOME/Documentos/workspace/track-frontend/
	npm install --location=global node@^13.13.52
}

install_frontend(){
	echo "Instalar o NODE"
	sleep 20
	npm i

}

sh_start(){
	cd $HOME/
	echo '' > start_dev.sh
	echo '#!/bin/bash' >> start_dev.sh
	echo 'cd $HOME/Documentos/workspace/track-backend/' >> start_dev.sh
	echo 'php artisan serve & ' >> start_dev.sh
	echo 'cd $HOME/Documentos/workspace/track-frontend/' >> start_dev.sh
	echo 'npm run serve & ' >> start_dev.sh
	echo 'google-chrome http://localhost:8080 & ' >> start_dev.sh
	echo 'cd $HOME/Documentos/workspace/ ' >> start_dev.sh
	echo 'code . & ' >> start_dev.sh
	echo 'exit ' >> start_dev.sh
	sudo chmod +x start_dev.sh
}

msg(){
	echo "Para iniciar o Desenvolvimento."
	echo "Abra o terminal e digite:"
	echo "./start_dev.sh"
}


}


remove_progs
install_pack
install_PHP
git_repositorio
cria_pasta
install_COMPOSER
gera_env
install_LARAVEL_require
install_LARAVEL_passport
php_artisan_passport
php_artisan_key
php_artisan_storage
download_frontend
install_frontend
sh_start
msg


