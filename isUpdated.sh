#!/usr/bin/env bash

latest_commit_date=$(curl -s "https://api.github.com/repos/rlguy/Blender-FLIP-Fluids/commits?path=cmake" | jq -r '.[0].commit.author.date')

if [ -z "$latest_commit_date" ]; then
  echo "No commits found or unable to retrieve commit data."
  exit 1
fi

days_since_commit=$(( ( $(date +%s) - $(date -d "$latest_commit_date" +%s) ) / (60 * 60 * 24) ))
echo "Days since last commit: $days_since_commit"

exit $days_since_commit
