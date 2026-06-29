pipeline {
    agent any

    triggers {
        cron('H/5 * * * *')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/vardhanacharya/program2.git'
            }
        }

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
                docker service create --name java-service --replicas 1 java-cicd-app:latest
                '''
            }
        }

        stage('Check Service') {
            steps {
                sh 'docker service ls'
                sh 'docker service ps java-service'
            }
        }
    }
}
