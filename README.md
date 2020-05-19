How to use:

**Step 1** - Create a folder with your project:
`mkdir project && cd project`

**Step 2** - Clone Tager repo to your project's folder:
`git clone git@github.com:ozitag/tager.git .`

**Step 3** - Prepare brand assets (Logo and Favicon):

- Put logo.svg or logo.png to assets folder
- Generate your favicon package on https://realfavicongenerator.net/, put result files on assets/favicon folder

**Step 4** - Run initialization script:

_For web + backend use:_
`./init-web-backend.sh`

_For web + backend + admin use:_
`./init-web-backend-admin.sh`

_For backend + admin use:_
`./init-backend-admin.sh`

**Step 4** - Add origin of your repository
`git remote add origin {REPO_URL}`

**Step 5** - Do initial push
`git push origin master`
