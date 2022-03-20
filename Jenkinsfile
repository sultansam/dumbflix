def secret = 'credential'
def server = 'ubuntu'
def directory = 'dumbflix'
def branch = 'master'

pipeline{
	agent any
	stages{
	   stage ('delete & git pull'){
		steps{
		   sshagent([secret]) {
			sh """sh -o StrictHostKeyChecking=no $(server) << EOF
			cd $(directory)
			docker-compose down
			docker system prune -f
			git pull origin $(branch)
			exit
			EOF"""
		}
            }
       }
	stage ('docker build'){
		steps{
			sshagent([secret]}
			sh """ssh -o StrictHostkeyChecking=no $(server) << EOF
			cd &{directory}
			docker-compose build
			exit
			EOF"""
		 }
             }
	}
	stage ('docker up'){
           steps{
		sshagent([secret]}
                sh """ssh -o StrictHostkeyChecking=no $(server) << EOF
		cd &{directory}
		docker-compose up -d
		exit
		EOF"""
	     }
         }
     }
   }
}
