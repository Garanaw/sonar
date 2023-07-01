# sonar
Sonar system based in Docker

# Howto

## Clone

Run this command to clone the project:

    git clone https://github.com/Garanaw/sonar.git

## Configuration:

Copy the `.env.example` file to `.env` and fill the user and password. Those are the credentials for the database.

You should run the following commands to allow Elasticsearch to initiate:

    sudo sysctl -w vm.max_map_count=262144
    sudo sysctl -w fs.file-max=65536
    ulimit -n 65536
    ulimit -u 4096

Also, the installation path has to be added to the $PATH:

    export PATH=$PATH:${INSTALL_DIRECTORY}/sonar-scanner/bin

## Scanner

Download Sonnar-scanner from [here](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/) and extract it into the ${INSTALL_PATH}.

## Project

To start Sonarqube, run the next command:

`./sonar.sh up`

Then you can access http://localhost:9000 and login with `admin` : `admin`. Once inside, create a new project and save the token.

To run a scan, go to your project and run:

    sonar-scanner -Dsonar.projectKey={project_key} -Dsonar.host.url=http://localhost:9000 -Dsonar.login={project_token}
