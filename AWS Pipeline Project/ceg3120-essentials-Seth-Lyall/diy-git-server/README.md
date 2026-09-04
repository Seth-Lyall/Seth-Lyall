# DIY Git Server

## The Application

- This application is a lightweight container for managing git repositories.
- It can be connected to through `ssh` where basic git actions can be performed.

## Dependencies

- `git`, `vim`, and `ssh` are installed in the bare Ubuntu container.
- A new user called `git` is added to the container.
  - This user has a `git-shell`, not `bash`.

## Container Image

- `Ubuntu:latest`

## Dependency Installation

- The dependencies were installed as follows:
```
docker run -it ubuntu:latest bash
apt update
apt install git
apt install vim
apt install ssh
useradd -m -s /usr/bin/git-shell git
cd /home/git
mkdir git-shell-commands # So the git connection can be established and git commands can be added by the user
exit
```
- The Ubuntu container was then exported as `diy-git.tar`, and into the container image `diy-git:latest`.
```
docker export "Ubuntu's docker ps name" -o diy-git.tar
docker import diy-git.tar diy-git:latest
```

## Changes or Additions

- In order to run this container application, you must add a public key of your choice to `/home/git/.ssh/authorized_keys`
  - Execute the following to add your public key:
  ```
  docker run -it diy-git:latest bash
  vim /home/git/.ssh/authorized_keys
  # paste your key into authorized_keys, save and close the file
  ```
- You may need to adjust any file permissions for git before any `ssh` connections can be made.
  - Run `chown -R git git` in the `/home` directory of the container to update all permissions in the `git` folder from root to git.
  #### - This will be necessary if any directories or files are owned by root in the git home directory.

## How to Use

- To build the image with the given Dockerfile, run:
```
docker build -t diy-git:latest -f git_server_dockerfile .
```
- If the docker image was built with `docker build` run `docker run -it -p 5000:22 diy-git:latest` (port 5000 is used in this example, but any available port is valid).
- Otherwise, to start to the container, run the following:
```
docker run -it -p 5000:22 diy-git:latest bash
service ssh start
```
- In a new shell window, run the following to `ssh` to the container:
```
ssh -i (path to private key) -p 5000 git@(your ipv4 address)
```
- Creating a repository (from `docker run -it diy-git:latest bash`):
  - `git init` will create the framework for basic git operations.
  - To specify the repository name, run `git init --bare "repo_name"` with "repo_name" as the name of your repository.
  - To retrieve code from a remote repository, run a normal `git clone`.
- After creating the repository in the container, it can be connected to with `ssh -i (path to private key) -p 5000 git@(your ipv4 address)`.
- A `.ssh/config` file can be made by the user to make it easier to `ssh` into the git server.

## Troubleshooting

- Make sure you are connecting to the container with `ssh` using the correct port.
  - To check the port the container is bound to, run `docker ps -a` and look for the container.
  - Check the container's connected port under the `PORTS` column.
- Make sure your private and public keys are consistent with the public key in the `authorized_keys` file within the container.
- In case you get an error indicating "dubious ownership" from git when connecting to a repository in the container, correct this by updating the ownership of the repository.
  - Repository ownership can be updated to `git` with `chown -R git git` when in the `/home` directory.
