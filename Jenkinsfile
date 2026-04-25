pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'gitcred', url: 'https://github.com/Satya-satya989/game.git']])
            }
        }

        stage('Setup Python Environment') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install --upgrade pip
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run App (Test)') {
            steps {
                sh '''
                . venv/bin/activate
                python app.py &
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t python-app .'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker stop python-container || true'
                sh 'docker rm python-container || true'
                sh 'docker run -d -p 5000:5000 --name python-container python-app'
            }
        }
    }
}
