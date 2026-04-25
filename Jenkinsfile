pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/Satya-satya989/game.git'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker rm -f game-app || true
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t game-app .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker run -d --name game-app -p 3000:80 game-app
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Build and Deployment Successful'
        }
        failure {
            echo '❌ Build Failed - Check logs'
        }
    }
}
