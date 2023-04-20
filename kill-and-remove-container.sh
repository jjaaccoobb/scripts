#!/usr/bin/env bash
container_ids=$(docker ps | grep "$1" | awk '{print $1}')
container_names=$(docker ps | grep "$1" | awk '{print $NF}')

if [ -z $container_ids ]; then
	echo "No matches for '$1'"
	exit
fi

echo $container_names | tr ' ' '\t'
echo $container_ids | tr ' ' '\t'
function yes_or_no {
	echo
	printf 'Are you sure you want to remove the containers? (y/[n])? '
	read answer

	if [ "$answer" != "${answer#[Yy]}" ]; then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
		return 0
	else
		exit
	fi
}

if yes_or_no; then
	echo "Removing containers\n"
	docker rm -f $container_ids
fi
