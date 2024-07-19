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
                sh "mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > mbTechdb-dump.sql"
                sh "aws s3 cp mbTechdb-dump.sql s3://mbtechbucket/techdb/"
            }
        }
        stage('checkout') {
            steps {
                git url: "$REPO_URL"
            }
        }
        stage('create database') {
            steps {
                script {
                    try {
                        sh "mysql -u $DB_USER -p$DB_PASSWORD -e \"create database if not exists $DB_NAME\""
                    } catch (err) {
                        echo err.getMessage()
                    }
                    sh "mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < mbTechdb-dump.sql"
                }
            }
        }
        stage('clean environment') {
            steps {
                cleanWs()
            }
        }
    }
}
