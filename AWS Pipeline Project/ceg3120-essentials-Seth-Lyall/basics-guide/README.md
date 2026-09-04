## Command Line Git

- `status`
  - Shows status of the local repository. This status includes:
    - The number of local commits that have not been synced with remote (GitHub)
    - A list of files in local folder than are NOT being tracked by git
    - A list of files in local folder that have changes that need to be committed
  - `git status`
- `log`
  - Shows the commit history of the current branch. Displays the following information for each commit:
    - Commit id (EG: commit a0141f7c63efcaf6dacbf4e576265347e9408c5d)
    - Author (Name, ID, Email)
    - Date (Weekday Month Day (### ### ##), time (##:##:##), year (####), time zone (-/+####)
    - Commit message
  - `git log`
- `clone`
  - Clones a github repository from a link
    - EG: `git clone git@github.com:WSU-kduncan/ceg3120-essentials-Seth-Lyall.git`
- `remote`
  - Manages the tracking of github repositories. Can:
    - Display the current tracked repository (`git remote`)
    - Add a new repository to be tracked (`git remote add`)
    - Rename a repository (`git remote rename`)
    - Remove a tracked repository (`git remote remove`)
    - Set the head of a tracked repository (`git remote set-head`)
    - Add branches to a tracked repository (`git remote set-branches`)
    - Get the URL of a tracked repository (`git remote get-url`)
    - Set the URL of a tracked repository (`git remote set-url`) (`--push`/`--add`/`--delete`)
    - Prune a tracked repository (`git remote prune`)
    - Update a local repository with a remote (`git remote update`)
  - `git remote`
- `add`
  - Adds a file for tracking to the github repository
  - `git add [filename]`
- `rm`
  - Removes a file for tracking from the github repository
  - To remove the file from the repository and working directory, you must remove the file for tracking then commit the change
  - `git rm [filename]` or `git rm [filename]` and `git commit -m "message"`
  - separately note how to remove from tracking versus fully remove a file from teh repository and working directory
- `commit`
  - Commits added changes on the local github repository
    - Can be run with or without `-m "message"` after `git commit`
    - If it is ran without `-m "message"`, then you must type the commit message separately in an editor such as `vim` or `nano`
  - `git commit -m "Changes were made to the repository"`
- `push`
  - Pushes or syncs changes from the local repository to the remote repository
  - `git push`
- `pull`
  - Pulls or syncs changes from the remote repository to the local repository
    - If there are changes that were made locally that do not align with the remote repository or vice versa, a merge or rebase pull may be necessary (`git merge` and `git pull --rebase`
    - For that reason, it is encouraged to always pull from the remote repository before work begins
  - `git pull`
- `branch`
  - Switches to a specified branch
    - The branch can have any name, but it is good practice to keep them recognizable
    - You can have as many branches as you want
  - `git branch "branchname"`
- `checkout`
  - Allows you to create a branch and automatically switch to it
  - `git checkout -b "branchname"`
- `fetch`
  - Fetches objects from a remote repository
    - Can specify how many objects to fetch, which to fetch, the depth of the fetch, and many more
  - `git fetch origin main`
- `merge`
  - Merges a branch back to main or a parent branch
    - Your current branch must be the branch you are merging into
    - EG: When merging into main, you must be on the main branch
  - `git merge [branchname]`
- `init`
  - Create an empty git repository or re-initialize an existing one
    - `init` can be run on both an existing folder and a bare repository
    - However, files in an existing folder must be added for tracking after `init` has been ran and the changes must be committed similar to a repository with newly added files
  - `git init`

## Git Files & Folders

- `.git` folder
  - The `.git` folder contains information related to git logs, command messages, repository histories, and information necessary for git to work
    - `COMMIT_EDITMSG` contains part of the built in git commit message
    - `FETCH_HEAD` contains the id and link of the head branch
    - `HEAD` contains an absolute path in .git to the id of the main branch
    - `ORIG_HEAD` contains the id of the head branch
    - `branches` contained git branches but is no longer in use
    - `config` contains information on the head branch and some settings that can be changed by the user
    - `description` a file used for naming a repository
    - `hooks` contains executables that are ran with git commands
    - `index` is a binary file that contains information on file entries tracked by git
    - `info` contains extra information that may be useful to a user of git. My info folder contains a file referencing exludes with C code
    - `logs` contains logs of pulls, pushes, commits, merges, and other repository operations performed by git
    - `objects` contains a data store for git content
    - `refs` contains values referencing specific repository commits
- `.gitignore` file
  - The `.gitignore` file contains parameters for files to be ignored when adding and/or committing files in your repository
    - To add a file to `.gitignore`, you simply type a name or extension into a line of the `.gitignore` file
    - Eg:
      ```
      *.exe
      *.tar
      ```
    - Here is an image featuring the `.gitignore` file in this repository
    
    ![.gitignore in bash](.gitignore_example.png)

## Command Line Docker

- `ps`
  - Displays the docker containers that are currently running
    - Use the `-a` flag to display all created docker containers active and inactive
    - `CONTAINER ID` contains an id for the listed container
    - `IMAGE` lists the image the docker container is using
    - `COMMAND` lists the command that ran or ran with the docker container
    - `CREATED` displays how long ago the container was made
    - `STATUS` displays the current state of the container. An active docker container will have the status `up`
    - `PORTS` display the ports the container is connected to
    - `NAMES` display an automatically generated name for the port so it can be easily and uniquely referenced
  - `docker ps -a`
- `images`
  - Displays all downloaded docker images that are ready to be ran
    - `IMAGE` displays the official name of the docker image
    - `ID` displays the id of the docker image
    - `DISK USAGE` displays the potential disk usage of the docker image
    - `CONTENT SIZE` displays the file size of the docker image
    - `EXTRA` contains additional flags for containers (EG: In Use)
  - `docker images`
- `run`
  - Creates and starts a given docker image. A few useful flags:
    - `-it` or `-i` and `-t` make the ran container interactive and enable terminal access
    - `-p` allows you to set the host and container ports (Eg: `-p 2000:80`)
    - `--name` lets you set a custom name for the container
  - `docker run -it python:3.12.3 bash`
- `start`
  - Starts an exited docker container
  - `docker start blissful_wright` or `docker start b5440f4dab16`
- `stop`
  - Stops an active docker container
  - `docker stop blissful_wright` or `docker stop b5440f4dab16`
- `exec`
  - Allows you to run a file in a docker container
  - `docker exec -it blissful_wright python /home/hello.py`
- `attach`
  - Lets you attach a stream to a container so it can be interacted with
  - `docker attach blissful_wright`
- `import`
  - Converts a docker container `.tar` file into a docker container image
    - Used in conjunction with `export`
  - `docker import "$PWD/blissful_wright.tar"  blissful_wright:latest`
- `export`
  - Converts a docker image into a `.tar` file so it can be transferred to a different location
    - Used in conjunction with `import`
    - The `-o` flag writes the `.tar` to a new file instead of `STDOUT`
  - `docker export blissful_wright -o blissful_wright.tar`
- `inspect`
  - Displays low-level information on a given docker container
  - `docker inspect blissful_wright`
- `logs`
  - Display the logs of a given container
    - `-f` shows extra information with the log output
    - `-t` adds timestamps to the logs
  - `docker logs blissful_wright`
- `kill`
  - Forcefully terminates the given container(s) name or id
    - `-s` lets you send an additional signal string to the container
  - `docker kill blissful_wright`
- `rm`
  - Removes a given docker container or image
    - `-f` sends an additional SIGKILL to the given container
    - `rm` is not to be confused with `image rm`, which removes images instead of containers
  - `docker rm blissful_wright`
  - `docker image rm hello-world:latest` or `docker rmi hello-world:latest`

## SSH

- To set up SSH authentication to GitHub repositories, you must first generate a local private key. To do this, you must run `ssh-keygen -t ed25519` to generate your key (Adding `-C "comment"` is optional). Then copy your accompanying public key into your GitHub account's SSH keys with a memorable name. After that, you can connect to a GitHub repository by cloning it with ssh using `git clone "ssh link"` which can be found on the main page of a repository.
- To set up an SSH connection to an AWS instance, you must have your public key authorized in the remote AWS server. When in the AWS portal, copy your public key from the AWS Academy Learner Lab and save it to a `.pem` file on your computer with a recognizable name. Click the little green button at the top left of the learner lab after starting the lab and copy the IP in EC2 to get an IP to connect to your AWS instance with. After this, run a command similar to the following: `ssh -i $PWD/key.pem username@AWS_IP` or, for example, `ssh -i C:/Users/lyall/Keys/key-aws-vm.pem ubuntu@###.##.##.#`
- Using the `config` file in the `.ssh` folder
- The `config` file in the `.ssh` folder is used to set up automatic SSH connections without needing to type a long command. Here is an example `.ssh/config` file entry:
  ```
  Host lyall
    Host lyall
    HostName ###.##.##.# (some IP address)
    User lyall
    IdentityFile ~/Keys/key.pem
    Port 22
  ```
  - `Host` is the name of the `config` file entry, it is what you enter after `ssh` to automatically connect
  - The second `Host` entry is the name of the host you are connecting to
  - `HostName` is the IP you will connect to
  - `User` is the username you will connect with
  - `IdentityFile` is the location of the public key you are connecting with
  - `Port` is the port you will connecting with (`ssh` uses port 22)

## Resources

The following resources were used while writing this document:

> I used this website to learn more about the .git/index and .git/objects files. https://git-scm.com/docs/
