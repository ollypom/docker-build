node("docker") {
    docker.withRegistry('https://52.56.228.3', '73b866c0-867a-463d-babc-f5d49ce6abb9') {
    
        git url: "https://github.com/ollypom/docker-build.git", credentialsId: 'd3f7ca2b-c6e7-464c-9723-e90f4bbacaf7'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "admin/test"
    
        stage "publish"
        app.push "${commit_id}"
        app.push 'latest'

        stage "run"
        sh "creds.sh"
        sh "docker stack deploy -c stack.yml testnginx"
    }
}
