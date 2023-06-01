pipeline {
    agent { label 'gpu' }

    stages {
        stage('Create Tables') {
            steps {
                sh 'psql --username=pguser02 --dbname=postgres --file=createtables.sql'
            }
        stage('Join Test 1') {
            steps {
                sh 'psql --username=pguser02 --dbname=postgres --file=jointest-ci.sql'
            }
            post {
                success {
                    slackSend(
                    message: "Jointest1は成功 (<${env.BUILD_URL}|Open>)",
                )
                }
                failure {
                    slackSend(
                    color: "#FF0000",
                    message: "Jointest1は失敗 (<${env.BUILD_URL}|Open>)",
                )
                }
            }            
            
        }
        stage('Join Test 2') {
            steps {
                sh 'psql --username=pguser02 --dbname=postgres --file=jointest-ci2.sql'
            } 
            post {
                success {
                    slackSend(
                    message: "Jointest2は成功 (<${env.BUILD_URL}|Open>)",
                )
                }
                failure {
                    slackSend(
                    color: "#FF0000",
                    message: "Jointest2は失敗 (<${env.BUILD_URL}|Open>)",
                )
                }
            }
        }
    }
}
