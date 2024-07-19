pipeline {
    agent {
        label 'agent1'
    }
    environment {
        DB_USER = 'root'
        DB_PASSWORD = 'root'
        DB_NAME = 'testdb'
        REPO_URL = 'https://github.com/Gyana545/myrepo.git'
    }
    stages {
        stage('create backup') {
            steps {
                sh 'mysqldump -u $(DB_USER)  -p $(DB_PASSWORD) $(DB_NAME) > mbTechdb-dump.sql'
                sh 'aws s3 cp mbTechdb-dump1.sql s3://mbtechbucket/techdb/'
            }
        }
        stage('checkout') {
            steps {
                git env.REPO_URL
            }
        }
        stage('create database') {
            steps {
                script {
                    try {
                        sh 'mysql -u $(DB_USER) -p $(DB_PASSWORD) -e "create database $(DB_NAME) IF NOT EXIST $DB_NAME"'
                    } catch (err) {
                        echo err.getMessage()
                    }
                    sh 'mysql -u $(DB_USER) -p $(DB_PASSWORD) $(DB_NAME) < mbTechdb-dump.sql'
                }
            }
        }
        stage('alter database') {
            steps {
                sh 'mysql -u $(DB_USER) -p $(DB_PASSWORD) $(DB_NAME) < mbTechdb-alter.sql'
            }
        }
        stage('clean environment') {
            steps {
                cleanWs()
            }
        }
    }
}
