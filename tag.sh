#!/bin/bash

# Get the version from pubspec.yaml using yq[^1^]
VERSION="v$(grep version pubspec.yaml | sed "s/version: //")"

echo $VERSION

# Create a git tag with the version
git tag $VERSION

# Push the tag to remote
git push origin $VERSION