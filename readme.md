# LEMP Stack Single Site
This LEMP stack is for testing and development of a single site, accessible at [http://localhost:8000](http://localhost:8000)

**Start**
```
docker-compose up -d
```

## phpMyAdmin
Visit [http://localhost:8080](http://localhost:8080) to access phpMyAdmin to easily edit the database. The database volume is persistent.

## HTML
HTML is editable in a persistent volume, in the **html** directory.

## Shell Access
```
docker exec -it <container_name> /bin/bash
```
This will launch shell access directly to the **html** directory.

## Composer
Composer is included.