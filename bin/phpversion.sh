#!/bin/bash

function upsearch () {
    slashes=${PWD//[^\/]/}
    directory="$PWD"
    for (( n=${#slashes}; n>0; --n ))
    do
        test -e "${directory}"/"$1" && echo "$directory"/"$1" && return
        directory="$directory"/..
    done
}

value=$(upsearch ".phpversion")
if [[ -z "$value" ]]; then
    echo "A .phpversion file must be defined. http://github.com/benallfree/mampenv"
    exit 1
else
    version=$(cat "${value}")
fi
php="/Applications/MAMP/bin/php/php${version}/bin/php"

if [ ! -e "$php" ]; then
    echo "PHP $version specified in .phpversion was not found ($php). http://github.com/benallfree/mampenv"
    exit 1
fi

conf="/Library/Application Support/appsolute/MAMP PRO/conf/php${version}.ini"