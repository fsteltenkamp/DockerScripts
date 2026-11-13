# Docker Volume Scripts

Simple scripts to make your life easier handling Docker Volumes.

## Scripts:
- dvbr
   - Backup and Restore Docker Volumes.
- dvfbr
   - Start a Web-Based File Browser to interact with files inside a Volume.
- dvls
   - List files inside a Volume.
- dvsh
   - Get a shell inside a Volume.
- dvsmbcr
   - Easily Create new Docker Volumes that are connected to a SMB Share.

## Flags:
Every Script accepts the following flags:
- \-\-update: Update the Script.
- \-\-install: install all other Scripts present in this repo on your machine.

## Tab-Completion:
`dockerscripts-completion.bash` adds bash tab-completion for all scripts:
- volume names (`dvbr`, `dvfbr`, `dvls`, `dvsh`)
- `backup` / `restore` modes and existing backups in `/srv/dvbr/<volume>` (`dvbr restore`)
- paths inside a volume (`dvls`, `dvsh`), listed with a short-lived read-only alpine container
- hostnames, uid/gid and common file/dir modes (`dvsmbcr`)

`--install` sets it up automatically. To install it manually (requires the `bash-completion` package):
```bash
mkdir -p /etc/bash_completion.d && wget https://raw.githubusercontent.com/fsteltenkamp/DockerScripts/refs/heads/main/dockerscripts-completion.bash -O /etc/bash_completion.d/dockerscripts
```
Or for your user only, add `source /path/to/dockerscripts-completion.bash` to your `~/.bashrc`.

## Installation:
dvbr:
```bash
wget https://raw.githubusercontent.com/fsteltenkamp/DockerScripts/refs/heads/main/dvbr -O /usr/local/bin/dvbr && chmod +x /usr/local/bin/dvbr
```
dvfbr:
```bash
wget https://raw.githubusercontent.com/fsteltenkamp/DockerScripts/refs/heads/main/dvfbr -O /usr/local/bin/dvfbr && chmod +x /usr/local/bin/dvfbr
```
dvls:
```bash
wget https://raw.githubusercontent.com/fsteltenkamp/DockerScripts/refs/heads/main/dvls -O /usr/local/bin/dvls && chmod +x /usr/local/bin/dvls
```
dvsh:
```bash
wget https://raw.githubusercontent.com/fsteltenkamp/DockerScripts/refs/heads/main/dvsh -O /usr/local/bin/dvsh && chmod +x /usr/local/bin/dvsh
```
dvsmbcr:
```bash
wget https://raw.githubusercontent.com/fsteltenkamp/DockerScripts/refs/heads/main/dvsmbcr -O /usr/local/bin/dvsmbcr && chmod +x /usr/local/bin/dvsmbcr
```