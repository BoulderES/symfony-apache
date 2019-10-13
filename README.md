# symfony-apache

### Features

-  Basic apache server for symfony apps development (only if you need something more than the built in php server) based on the [official php image](https://hub.docker.com/_/php) (tag [php:7.3.10-apache](https://hub.docker.com/layers/php/library/php/7.3.10-apache/images/sha256-f00c75e633d6bbc1b30d5156c06377e48c543263dfd2ac4d910b176386ad4fdf)) with a couple of changes to make symfony easy to run.

### Requeriments

- Composer installed in your local machine.
- Docker service running.

### How to use this image

Change [/path/that/you/want], [project_name] and local port [8080] by your own...

```bash
$ cd /path/that/you/want
$ composer create-project symfony/skeleton project_XXX
$ docker run -d -p 8080:80 --name project_name -v /path/that/you/want/project_name:/var/www/html boulder80/symfony-apache
```
Go to http://localhost:8080.
## License

[The MIT License](http://opensource.org/licenses/MIT)

Feel free to use or fork to adapt to your own needs.