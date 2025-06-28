@Library('shared-lib') _

pipeline {
    agent any

    environment {
        GITLAB_TRIGGER_TOKEN = credentials('GITLAB_TRIGGER_TOKEN')
        TOMCAT_CREDS = credentials('tomcat-deploy-creds')
        ARTIFACT_DIR = '/var/lib/jenkins/artifacts'
        GITLAB_PROJECT_ID = '1'
    }

     stages {
        stage('Trigger GitLab Build+Deploy') {
            steps {
                script {
                    def triggerUrl = "http://localhost/api/v4/projects/${env.GITLAB_PROJECT_ID}/trigger/pipeline"
                    def refBranch = ACTION == 'Deploy Existing' ? 'Development' : "${VERSION_TAG}-main"

                    sh """
                        curl --request POST "${triggerUrl}" \\
                         --form token=${GITLAB_TRIGGER_TOKEN} \\
                         --form ref=${refBranch} \\
                         --form variables[VERSION_BRANCH]=${VERSION_TAG}-main \\
                         --form variables[CUSTOMER_LIST]=${CUSTOMERS} \\
                         --form variables[TAG_VERSION]=${VERSION_TAG} \\
                         --form variables[ACTION]="${ACTION}" \\
                         --form variables[DEPLOY_ALL]=${DEPLOY_ALL} \\
                         --form variables[SELECTED_WARS]="${SELECTED_WARS}"
                    """
                }
            }
        }
    }

    

    post {
        always {
            cleanWs()
        }
    }

}