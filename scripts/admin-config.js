const fs = require('fs');
const path = require('path');

const ensureDirectoryExistence = filePath => {
    var dirname = path.dirname(filePath);
    if (fs.existsSync(dirname)) {
        return true;
    }
    ensureDirectoryExistence(dirname);
    fs.mkdirSync(dirname);
}

const processDockerComposeFile = (filePath, config) => {
    if (fs.existsSync(filePath) === false) {
        console.log('Docker file `' + filePath + '` is not found');
        return;
    }

    let fileRaw = fs.readFileSync(filePath, 'utf-8').toString();
    Object.keys(config).forEach(key => {
        const value = typeof config[key] === 'boolean' ? (config[key] ? 1 : 0) : config[key];
        fileRaw = fileRaw.replace('{{CONFIG_' + key + '}}', value);
    });
    fs.writeFileSync(filePath, fileRaw);
};

const throwError = error => {
    console.error('Error: ' + error);
    process.exit();
};

const preparePrettyJSON = jsonObject => {
    return JSON.stringify(JSON.parse(JSON.stringify(jsonObject)), null, 2);
};

if (process.argv.length < 3) {
    throwError('Project root is not set');
}

const sourceConfigFile = __dirname + '/' + process.argv[2];
const projectRoot = __dirname + '/' + process.argv[3];

if (!fs.existsSync(sourceConfigFile)) {
    throwError('Source config not found');
}

const sourceConfig = require(sourceConfigFile);

if (!sourceConfig.admin) {
    process.exit();
}

const adminConfig = sourceConfig.admin;

const adminAuthConfig = 'admin-auth' in sourceConfig ? sourceConfig['admin-auth'] : {
    "APP_NAME": "OZiTAG - Login",
    "LOGO": "logo.svg",
    "BRAND_COLOR": "#DD6900"
};

processDockerComposeFile(projectRoot + '/docker-compose.dev.yml', adminAuthConfig);
processDockerComposeFile(projectRoot + '/docker-compose.yml', adminAuthConfig);

if ('AUTH_LOGO_EXT' in adminConfig) {
    delete adminConfig.AUTH_LOGO_EXT;
}

const destConfig = projectRoot + '/admin/src/config/config.json';
ensureDirectoryExistence(destConfig);
fs.writeFileSync(destConfig, preparePrettyJSON(adminConfig));
