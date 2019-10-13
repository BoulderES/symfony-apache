# symfony-apache

### Features

-  basic apache server for symfony apps development (only if you need something more than the built in php server).

### Requeriments

- Composer installed in your local machine.
- Docker service running.

### How to use this image

Change [/path/that/you/want], [project_XXX] and local port [8080] by your own...

```bash
$ cd /path/that/you/want
$ composer create-project symfony/skeleton project_XXX
$ cd project_XXX
$ docker run -d -p 8080:80 --name project_XXX -v /path/that/you/want/project_XXX:/var/www/html boulder80/symfony-apache
```

## License

[The MIT License](http://opensource.org/licenses/MIT)

Feel free to use or fork to adapt to your own needs.