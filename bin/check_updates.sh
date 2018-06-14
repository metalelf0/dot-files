#!/bin/zsh
tempfile=output
touch $tempfile

check_update () {
  cd $1
  if [[ -d .git ]]
  then
    git ls-remote --exit-code origin 1>/dev/null 2>/dev/null
    if ! [[ $? = 0 ]]; then echo "Origin not found for "$1; exit -1; fi
    git fetch -q origin
    commits_count=`git log master..origin/master --oneline | wc -l`
    if [[ $commits_count != 0 ]]
    then
      echo "🔃 "$1" is "$commits_count" commit(s) behind origin/master" >> ../$tempfile
    elif [ 'full' = "$MODE" ]
    then
      echo "✔️ "$1" is aligned with origin/master"  >>  ../$tempfile
    fi
  fi
  cd ..
}

OPTS=`getopt -o m: --long mode: -n 'parse-options' -- "$@"`
if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

eval set -- "$OPTS"

MODE=full

while true; do
  case "$1" in
    -m | --mode ) 
      if [[ "$2" != 'full' && "$2" != 'only-behind' ]]
      then
        echo 'Valid options for -m / --mode: (full | only-behind)'
        exit -1
      else
        MODE="$2"
      fi
      shift; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

echo 'Please wait...'
for dir in `ls -d */`
do
  check_update "$dir" &
done
wait
cat $tempfile | sort
rm $tempfile
