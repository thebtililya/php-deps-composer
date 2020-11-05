pipeline {
  agent any
  
  stages {  
    stage('Deliver Docker images') {
      agent {
        docker {
          image 'docker:19.03.12-dind'
          args '-e DOCKER_HOST=$DOCKER_HOST'
        }
      }

      steps {
        echo $BRANCH_NAME
      }  
    }
  }
}
