function note {
  if [ -d "${HOME}/notes" ]; then
    pushd $HOME/notes
      git pull
      vim $(date +"%Y-%m-%d").md
      git add --all && git ci -m "note" && git push origin head
    popd
  fi
}

# These are for work
function authbosh {
    set -e -u -x
    lpass sync

    env_name=${1:-Prod}
    bosh_alias=${2:-prod}

    bosh_url=$(lpass show "${env_name} BOSH Director" --url)

    {
      lpass show "${env_name} BOSH Director" --username
      lpass show "${env_name} BOSH Director" --password
    } | bosh -e ${bosh_url} login

    bosh -e ${bosh_url} alias-env ${bosh_alias}

    mkfifo -m600 /tmp/authbosh.fifo
    trap "rm /tmp/authbosh.fifo" EXIT

    lpass show "${env_name} GCP Key" --notes >/tmp/authbosh.fifo &

    ssh-add -t8h /tmp/authbosh.fifo
    set +e +u +x
}

function credhub-login {
    set -e -u

    echo "checking for lastpass target..."
    lpass sync

    echo "targeting credhub..."
    credhub api "$(lpass show 'Shared-Concourse/Prod CredHub' --url)"
    credhub login -u "$(lpass show 'Shared-Concourse/Prod CredHub' --username)" -p "$(lpass show 'Shared-Concourse/Prod CredHub' --password)"
    set +e +u
}
