#!/bin/bash

if [ -n "${TRAVIS_TAG}" ]; then 
    TAG=${TRAVIS_TAG}; else
    TAG="v-$(git log -1 --pretty=%h)-beta";
fi

if [ "${TRAVIS_BRANCH}" == "master" ] && [ "${TRAVIS_PULL_REQUEST_BRANCH}" = "" ]; then 
    docker tag "${REPO}":"${TAG}" "${REPO}":latest;  else
    docker tag "${REPO}":"${TAG}" ;
fi