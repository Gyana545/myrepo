pipeline {
    agent {
        label 'agent1'
    }
    stages {
        stage('create backup') {
            steps {
                sh 'mysqldump -u root -proot testdb > mbTechdb-dump1.sql'
                sh 'aws s3 cp mbTechdb-dump1.sql s3://mbtechbucket/techdb/'
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
