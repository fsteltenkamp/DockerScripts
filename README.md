# DVBR

A Simple Bash Script to back up and restore docker volumes (contents)

## Usage

1. Prepare the backups directory.
   - By default, this directory is `/mnt/dvbr`.
   - You can mount anything you want there.
2. Use the script!

### Commandline Usage examples

`dvbr backup <volume_name>`  
- This will create a tar file in `/mnt/dvbr/<volume_name>/` with the current date.
  
`dvbr restore <volume_name> file_with_stuff.tar.gz`
- This will restore the file `file_with_stuff.tar.gz` from `/mnt/dvbr/<volume_name>` to your volume.
- The script will ALWAYS look in the mounted directory, since nothing else on the host system is visible to it.
