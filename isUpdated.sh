#!/bin/bash
exit $(curl -s https://api.github.com/repos/rlguy/Blender-FLIP-Fluids/commits?path=cmake | jq -r "((now - (.commit.author.date | fromdateiso8601) )  / (60*60*24)  | trunc)")