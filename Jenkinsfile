pipeline {
    agent {
        label 'agent1'
    }
    stages {
        stage('create backup') {
            steps {
                sh 'mysqldump -u root -proot testdb > mbTechdb-dump.sql'
            }
        }
        stage('checkout') {
            steps {
                git 'https://github.com/Gyana545/myrepo.git'
            }
        }
        stage('create database') {
            steps {
                script {
                    try {
                        sh 'mysql -u root -proot -e "create database testdb IF NOT EXIST mbTechdb"'
                    } catch (err) {
                        echo err.getMessage()
                    }
                    sh 'mysql -u root -proot testdb < mbTechdb-dump.sql'
                }
            }
        }
        stage('alter database') {
            steps {
                sh 'mysql -u root -proot testdb < mbTechdb-alter.sql'
            }
        }
        stage('clean environment') {
            steps {
                cleanWs()
            }
        }
    }
}
