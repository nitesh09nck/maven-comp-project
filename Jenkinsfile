pipeline {
    agent any

    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/nitesh09nck/maven-comp-project.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh 'mvn clean verify sonar:sonar'
                }
            }
        }

        stage('Build Maven Artifact') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nitesh09nck/maven-comp-proj:${BUILD_NUMBER} .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                sh 'docker push nitesh09nck/maven-comp-proj:${BUILD_NUMBER}'
            }
        }
    }
}

