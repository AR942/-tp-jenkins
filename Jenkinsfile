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

import matplotlib.pyplot as plt
import pandas as pd

# Supposons que 'user_id' est l'identifiant de l'utilisateur que vous souhaitez visualiser
user_id = '123'

# Filtrer les données pour l'utilisateur spécifique
user_data = data[data['user'] == user_id]

# Agréger les données par intervalles de temps et compter le nombre de scores touchés
user_data_grouped = user_data.groupby(pd.Grouper(key='_time', freq='4H'))['score_ALL', 'score_CA', 'score_CC', 'score_CO', 'score_DE', 'score_DI', 'score_EF', 'score_EX', 'score_IA', 'score_IM', 'score_LM', 'score_MT', 'score_PE', 'score_PT', 'score_RE'].sum()

# Créer un graphique temporel
plt.figure(figsize=(10, 6))
for column in user_data_grouped.columns:
    plt.plot(user_data_grouped.index, user_data_grouped[column], label=column)
plt.xlabel('Time')
plt.ylabel('Number of Scores Touched')
plt.title('Number of Scores Touched Over Time for User ' + user_id)
plt.xticks(rotation=45)
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
