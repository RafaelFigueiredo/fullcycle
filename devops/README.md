# Devops

## Configure Laravel to run with Docker

This project setup a complete Laravel environment, with mysql, redis, nginx and php-fpm

### How to run this project as it is

Up all project with docker-compose

```sh
git clone https://github.com/RafaelFigueiredo/fullcycle.git && \
cd fullcycle/devops/laravel && \
sudo docker-compose up --build && \
```

and, visit http://localhost:80



### How to create an empty project

1. Copy src files **from** container to host

> ```sh
> sudo docker run -v $(pwd)/src:/src/www --rm -it docker.io/silvafigueiredo/laravel cp -r /var/www /src  && \
> sudo chown -R $USER:$USER ./src
> ```


2. Test if everything is ok
> ```sh
> sudo docker run -p 8000:8000 -it docker.io/silvafigueiredo/laravel artisan serve --host=0.0.0.0
> ```
> and visit http://localhost:8000 to see if laravel is up

3. Run migrations and key generation
> ```sh
> sudo docker exec -it app sh
> ```
> and inside container shell:
> ```sh
> php artisan migrate
> php artisan key:generate
> ```


