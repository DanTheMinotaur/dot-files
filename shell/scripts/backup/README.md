# Backup Script

## Borg Setup

```
export BORG_BACKUP_REPO="$HOME/backup/test"
mkdir -p $BORG_BACKUP_REPO
borg init --encryption=repokey $BORG_BACKUP_REPO
```

## Archive Borg Repo
```
tar -czvf /tmp/borg-repo-backup.tar.gz $BORG_BACKUP_REPO
```

## Link script

```sh
sudo ln -s (pwd)/backup.sh /usr/local/bin/backup
```

## Systemd Jobs

### Create job as user

[Environment Variables Setup](https://wiki.archlinux.org/title/Systemd/User#Environment_variables)

```
touch ~/.config/environment.d/borg.conf # or whatever
```

```
BORG_PASSPHRASE=""
BORG_BACKUP_REPO="$HOME/backup/test"
```

```sh
# service
ln -s (pwd)/borg-backup.service ~/.config/systemd/user/borg-backup.service
systemctl --user daemon-reload

systemctl --user start borg-backup.service
systemctl --user enable borg-backup.service
systemctl --user status borg-backup.service

# timer
ln -s (pwd)/borg-backup.timer ~/.config/systemd/user/borg-backup.timer
systemctl --user daemon-reload

systemctl --user enable borg-backup.timer
systemctl --user start borg-backup.timer
systemctl --user status borg-backup.timer
```
