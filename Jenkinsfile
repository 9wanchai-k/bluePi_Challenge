pipeline {
    agent any
    stages {
        stage('Build ') {
            steps {
                echo "Run Robotframework"
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    script{
                        try {
                            sh 'robot ./testcase'
                        }
                        catch (err) {
                            sh 'echo "Error build"'
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            robot(
                outputPath: './',
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableArchiveOutput: false,
                passThreshold: 100.0,
                unstableThreshold: 100.0,
                otherFiles: '*.png,*.jpg'
            )
            echo "Clean Workspace"
            cleanWs() 
        }
    }
}