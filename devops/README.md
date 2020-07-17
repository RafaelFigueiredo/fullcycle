Copy files to host
```sh
sudo docker run -v $(pwd)/src:/src/www --rm -it docker.io/silvafigueiredo/laravel cp -r /var/www /src  && \
sudo chown -R $USER:$USER ./src
```

Run only laravel
```sh
sudo docker run -p 8000:8000 -it docker.io/silvafigueiredo/laravel artisan serve --host=0.0.0.0
```
http://localhost:8000

Up all project with docker-compose
