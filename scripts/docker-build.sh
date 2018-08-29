#!/bin/bash

TAG="v-$(git log -1 --pretty=%h)-beta";

docker build -t "${REPO}":"${TAG}" .

