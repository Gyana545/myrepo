pipeline {
    agent {
        label 'agent1'
    }
    stages {
        stage('create backup') {
            steps {
                sh 'mysqldump -u root -proot testdb > mbTechdb-dump1.sql'
            }
        }
        
        stage('alter database') {
            steps {
                sh 'mysql -u root -proot testdb < mbTechdb-alter.sql'
            }
        }
        stage('clean environment') {
            steps {
                echo "gyana"
            }
        }
    }
}
