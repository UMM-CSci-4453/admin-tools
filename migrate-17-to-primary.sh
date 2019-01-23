#!/usr/bin/env bash

NUM_LABS=11

for (( i = 1; i <= NUM_LABS; i++ )); do
  echo "Processing Lab $i"
  OLD_REPO=https://github.com/UMM-CSci-4453-Fall-2017/Lab-$i.git
  NEW_REPO=https://github.com/UMM-CSci-4453/Lab-$i

  git clone --bare $OLD_REPO
  # I'm sleeping for a second to help avoid freaking GitHub out
  # and think we're a bot (which we are, but whatever).
  sleep 1
  # The repos have to be already created on GitHub before you
  # push them up. This could probably be avoided using their
  # API tools, but I didn't want to wade into that swamp right now,
  # so I just created the repos.

  cd Lab-$i.git
  git push --mirror $NEW_REPO
  cd ..

  rm -rf Lab-$i.git
  echo "Done with Lab $i"
  echo
  #statements
done
