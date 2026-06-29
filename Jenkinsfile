pipeline {
    agent any

    triggers {
        cron('H/5 * * * *')
    }

    stages {
        stage('Build Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java-cicd-app:latest .'
            }
        }

        stage('Deploy Docker Swarm') {
            steps {
                sh '''
                docker swarm init || true
                docker service rm java-service || true
                docker run --rm java-cicd-app:latest
                '''
            }
        }
    }
}}
