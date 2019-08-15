# docker-gulp-sass-node
This docker file contains the following programs
* node
* gulp
* bower
* pm2
* sass (suitable for sass operations in gulp)
* ssh libraries and client (should npm need to reach a private git repository, ssh keys will need to be provided)
* adds nodeuser suitable for running the app non priviledged
* bash
* setting global npm log level

In the docker file are samples of the following actions (commented out)
* copy ssh keys
* copy application files to a work dir /var/www/app/current
* run the application using pm2

## Sample processes.json file for pm2
```
{
    "apps": [
        {
            "name": "api",
            "script": "server.js",
            "merge_logs": true,
            "max_restarts": 20,
            "instances": 1,
            
            "max_memory_restart": "200M",
            "env": {
                "PORT": 8888,
                "NODE_ENV": "development"
            }
        }
    ]
}

```
## Folder Structure
```
---
  -- Dockerfile
  -- docs
  -- .dockerignore
  -- nodeapp
     -- application code
  -- homedir
     .ssh
```

## Commands

* *build* docker build -t webapp-backend:alpha . (same folder as docker file)
* *run* docker run -p 80:8888 -d webapp-backend:alpha (app will be on port 80)


## Docker Ignore File
* /docs/
* /nodeapp/nbproject

### Note
node_modules WILL be copied to image


