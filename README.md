###### Project initialization:

**Step 1** - Create a folder with your project:
`mkdir project && cd project`

**Step 2** - Clone Tager repo to your project's folder:
`git clone git@github.com:ozitag/tager.git .`

**Step 3* - Prepare brand assets (Logo and Favicon) project:

- Put your logo file (300х300) to assets folder (optional, because you can set absolute URL of your logo)
- Generate your favicon package on https://realfavicongenerator.net/, put result files on assets/favicon folder
- Set config options on config.json

**Step 4** - Run initialization script:

_For web use:_
`./init-web.sh`

_For web + backend use:_
`./init-web-backend.sh`

_For web + backend + admin use:_
`./init-web-backend-admin.sh`

_For backend + admin use:_
`./init-backend-admin.sh`

**Step 5** - Add origin of your repository
`git remote add origin {REPO_URL}`

**Step 6** - Do initial push
`git push origin master`


###### Server installation

**Step 1** - Create .env file
```
APP_NAME=tager   # Prefix for docker container names
APP_PORT=3000    # External application port 

MYSQL_EXTERNAL_PORT=33066  # External MySQL Port (for projects with backend)
```

**Step 2** - Run Docker Compose
```
docker-compose -f docker-compose.dev.yml --project-name presetbox up --build --force-recreate -d
```

**Step 3** - Configure Nginx

```
server {
    server_name domain.com;

    location / {
        proxy_pass http://127.0.0.1:3000;   # Change 3000 to your external application port
        proxy_http_version 1.1;
        proxy_set_header Host $http_host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```
