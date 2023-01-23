pipeline {

    agent any
    stages {
    stage('StageBranch') {
            steps {
                //sh "git branch staging"
                sh "git checkout staging"
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
                sh "docker login --username=tutus94 --password=Star94220@"
                sh "docker tag jenkins-tp tutus94/jenkins-tp:jenkins-tp"
                sh "docker push tutus94/jenkins-tp:jenkins-tp"
            }
        }
        stage('MergeToMain') {
            steps{
                sh "git branch"
                sh "git checkout master"
                sh "git pull -f origin master"
                sh "git push -f origin staging:master"
            }
        }
    }   
}