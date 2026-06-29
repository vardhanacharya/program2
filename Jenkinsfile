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
                sh 'docker swarm init || true'
                sh 'docker service rm java-service || true'
                sh 'docker service create --name java-service --restart-condition none java-cicd-app:latest'
            }
        }
    }
}
