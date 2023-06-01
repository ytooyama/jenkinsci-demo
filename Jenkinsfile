pipeline {
    agent { label 'gpu' }

    stages {
        stage('Create Tables') {
            steps {
                sh 'psql --username=pguser02 --dbname=postgres --file=createtables.sql'
            }
        }
        stage('JoinTest1') {
            steps {
                sh 'psql --username=pguser02 --dbname=postgres --file=jointest-ci.sql'
            }
            post {
                success {
                    slackSend(
                    message: "JoinTest1は成功 (<${env.BUILD_URL}|Open>)",
                )
                }
                failure {
                    slackSend(
                    color: "#FF0000",
                    message: "JoinTest1は失敗 (<${env.BUILD_URL}|Open>)",
                )
                }
            }            
            
        }
        stage('JoinTest2') {
            steps {
                sh 'psql --username=pguser02 --dbname=postgres --file=jointest-ci2.sql'
            } 
            post {
                success {
                    slackSend(
                    message: "JoinTest2は成功 (<${env.BUILD_URL}|Open>)",
                )
                }
                failure {
                    slackSend(
                    color: "#FF0000",
                    message: "JoinTest2は失敗 (<${env.BUILD_URL}|Open>)",
                )
                }
            }
        }
    }
}
