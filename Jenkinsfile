def bucketname = null
pipeline{
    agent any
    tools {
        terraform 'terraform-11'
    }
//     parameters {
//       string description: 'Name of the S3 Bucket', name: 'bucketName'
//       string description: 'OPS Ticket Number Eg: OPS-11913', name: 'ticket_number'
//       string description: 'Variable file name (without .tfvars extension)', name: 'file_name'
// }

    // }
    stages {
//         stage('Git checkout')
//         {
            
//                 steps{
//                     git branch: 'main', credentialsId: '02c515b6-f2d9-433b-914c-a18921a5dad1', url: 'https://github.com/AdityaNutulapati/test-s3-1'
                    
//                 }
//         }
        // stage('Input Bucket Name')
        // {
        //     steps{
        //         script {
        //     bucketName = input (
        //     message: 'Enter Name of the Bucket', 
        //     ok: 'Submit', 
        //     parameters: [string(name: 'bucketName', trim: true)]
        //   )
        // }
            // }
        // }
        stage("Scale MongoDB"){
                    sh "consul-template -template \"Dockerfile.tmpl:Dockerfile\" -once" 
                    def dockerimage = docker.build("mongo-scaling-image")
                    dockerimage.inside{
                        sh '''
                        echo "hello world"
                        '''
                    }
                }
        
    }
}
// }