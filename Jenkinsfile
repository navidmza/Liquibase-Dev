#!/usr/bin/env groovy
// Liquibase declarative pipeline
//
//
pipeline {
agent any
  environment {
    PATH="/usr/local/bin:$PATH"
    ENVIRONMENT_STEP="${params.'Pipeline Step'}"
  }
  stages {

    stage ('Precheck docker version') {
                steps {
                        sh '''
        docker --version
                        '''
                } // steps
        } // stage 'precheck'
  
  stage ('running liquibase with docker') {
      steps {
        // checkout Liquibase project from CLO repo
        sh '''
          cwd=$(pwd)
          docker run --network=host --rm -v "${cwd}"/changelogs:/liquibase/changelog liquibase/liquibase --url="jdbc:postgresql://localhost:5432/${ENVIRONMENT_STEP}" --changeLogFile=changelog.postgres.sql --username=lbase --password=lbase status --verbose
          docker run --network=host --rm -v "${cwd}"/changelogs:/liquibase/changelog liquibase/liquibase --url="jdbc:postgresql://localhost:5432/${ENVIRONMENT_STEP}" --changeLogFile=changelog.postgres.sql --username=lbase --password=lbase updatesql
          docker run --network=host --rm -v "${cwd}"/changelogs:/liquibase/changelog liquibase/liquibase --url="jdbc:postgresql://localhost:5432/${ENVIRONMENT_STEP}" --changeLogFile=changelog.postgres.sql --username=lbase --password=lbase --logLevel=debug update
          '''
      } // steps for checkout stages
    } // stage 'checkout'
    
  } // stages
}  // pipeline

