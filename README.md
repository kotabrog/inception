# inception

## Overview

Wordpress, nginx, mariadb environment built with docker-compose.

## Requirement

- linux

## Usage

Clone first.

```
git clone ...
cd inception
```

Then rewrite the srcs/.env.

```
# Path of the folder where the volume will be created from the viewpoint of inception/
VOLUME_DIR_FROM_ROOT=.
# Path of the folder where the volume will be created from the viewpoint of inception/srcs/
VOLUME_DIR=../
# URL where wordpress will appear
WP_URL=localhost

...
```

Next, if you have set your WP_URL to something other than localhost, do the following

```
make host_setting
```

Next, create a folder to store the database and wordpress.

```
make make_dir
```

Then, launch the container with docker-compose.

```
make
```

Then you should be able to see wordpress.

https://localhost  
(if you have set your WP_URL, https://WP_URL)

You can also access the wordpress login page at  
https://localhost/wp-login.php  
(if you have set your WP_URL, https://WP_URL/wp-login.php)

If you ever want to close wordpress, first type ctrl+C. and

```
make down
make fclean
```

If you have set your WP_URL to something other than localhost

```
make host_clean
```

## Description

- I don't use ready-made Docker images or DockerHub except for alpine
- The following three containers are connected in one network
  - nginx
  - wordpress
  - mariadb
- There are two volumes
  - Volume to store the page to be displayed
  - volume to store the database

## Author

[twitter](https://twitter.com/Kotabrog)

## Licence

[MIT](https://github.com/kotabrog/inception/blob/main/LICENSE)
