FROM nginx

ADD /etc/laravel.conf /etc/nginx/conf.d/default.conf
ADD /laravel /var/www