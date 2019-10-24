function note {
  if [ -d "${HOME}/notes" ]; then
    pushd $HOME/notes
      git pull
      vim $(date +"%Y-%m-%d").md
      git add --all && git ci -m "note" && git push origin head
    popd
  fi
}
