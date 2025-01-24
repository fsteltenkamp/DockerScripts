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
wget https://raw.githubusercontent.com/fsteltenkamp/DockerScripts/refs/heads/main/dvbr -O /usr/local/bin/dvsmbcr && chmod +x /usr/local/bin/dvsmbcr
```