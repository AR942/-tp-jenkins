pipeline {

    agent any
    stages {
    stage('StageBranch') {
            steps {
                sh "git branch --delete staging"
                sh "git checkout -b staging"
                sh "git pull origin dev"
                sh "git push origin staging"
            }
        }
        stage('Build') {
            steps {
                sh "pip3 install -r requirements.txt"
            }
        }
        stage('Test') {
            steps {
                sh "python3 test_main.py "
            }
        }
        stage('DockerBuild') {
            steps {
                sh "docker build -t jenkins-tp ."
            }
        }
            /*stage('DockerRun') {
            steps {
                sh "docker run -d jenkins-cd-private"
            }
        }*/
        stage('DockerPush') {
            steps{
                sh "docker login --username= --password=```"
                sh "docker tag jenkins-tp tutus94/jenkins-tp:jenkins-tp"
                sh "docker push tutus94/jenkins-tp:jenkins-tp"
            }
        }
        stage('MergeToMain') {
            steps{
                sh "git checkout main"
                sh "git pull origin main"
                sh "git merge staging"
                sh "git push origin main"
            }
        }
    }   
}
