# Description

**docker-redmine-themes** Dockerfile to build a container image with themes for Redmine.

## List of themes

### Redmine basic

 * Alternate
 * Classic

### RedmineUp

 * A1 theme
 * Circle theme
 * Coffee theme
 * HighRise theme
 * RedmineCRM theme

### RM+

 * Alex skin

# Installation

Here are examples of how you can use the image.

Docker-Compose:
```
version: '2'

volumes:
  redmine-themes:

services:
  redmine-themes:
    image: dmitriiageev/redmine-themes
    volumes:
      - redmine-themes:/usr/src/redmine/public/themes

  redmine:
    image: redmine
    restart: always
    depends_on:
      - redmine-themes
    ports:
      - 80:3000
    volumes:
      - redmine-themes:/usr/src/redmine/public/themes
```

Docker:

```
# Create themes container
$ docker create -v /usr/src/redmine/public/themes --name redmine-themes dmitriiageev/redmine-themes

# Then link that to redmine container
$ docker run -d --volumes-from redmine-themes --name redmine -p 80:3000 redmine
```

# Upgrading

To upgrade to newer releases, simply pull the new image from the Docker hub, recreate and restart docker/docker-compose containers.


# References

 * Redmine
 * RedmineUP
 * RMPlus

