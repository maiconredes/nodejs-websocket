workflow "Build, Test, and Publish" {
  on = "push"
  resolves = ["Docker"]
}

action "Build" {
  uses = "actions/npm@master"
  args = "install"
}

action "Test" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "test"
}

# Filter for a new tag
action "Tag" {
  needs = "Test"
  uses = "actions/bin/filter@master"
  args = "tag"
}

action "Docker" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Tag"]
  args = "build -t WesleyCharlesBlake/nodejs-websocket ."
}
