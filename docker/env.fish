set script_dir (cd (dirname (status -f)); and pwd)
cd -

set -gx DOCKER_COMPOSE_YAML $script_dir/docker-compose.yaml
set debug true

function euler
    set file $argv[1]
    $debug ;and echo $file

    set ext (path extension $file)   
    $debug ;and echo $ext

    switch $ext
        case .go
            set lang go
        case .java
            set lang java
        case .js
            set lang javascript
        case .php
            set lang php
        case .pl
            set lang perl
        case .py
            set lang python
        case .rb
            set lang ruby
        case .rs
            set lang rust
        case .ts
            set lang typescript
        case '*'
            echo "Language no detected for file: $file"
            exit 1
    end

    echo "Detected language: $lang"

    set cmd "docker-compose --file $DOCKER_COMPOSE_YAML run $lang /w/$file"
    $debug ;and echo $cmd

    echo -n "Result: "
    eval $cmd
end