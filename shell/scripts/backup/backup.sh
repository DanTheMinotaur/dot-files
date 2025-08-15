#!/bin/bash

# Usage: ./backup.sh
# Description: Wrapper for borg backup, creates watchlists and generates backups for a borg repo


backup_add() {
    # Check if an argument was provided
    if [ -z "$1" ]; then
        echo "Usage: $0 add <file-or-directory-path>"
        exit 1
    fi

    TARGET="$(realpath $1)"

    # Check if the file or directory exists
    if [ ! -e "$TARGET" ]; then
        echo "Error: '$TARGET' does not exist."
        exit 1
    fi

    # Check for duplicates
    if grep -Fxq "$TARGET" "$WATCHLIST"; then
        echo "Info: '$TARGET' is already in the backup list."
        exit 0
    fi

    # Add the path to the watchlist
    echo "$TARGET" >> "$WATCHLIST"
    echo "Success: '$TARGET' added to backup list."
}

backup_borg() {
    if ! command -v borg &> /dev/null; then
      echo "Borg is not installed. Please install borg to use this feature."
      exit 1
    fi
    TIMESTAMP=$(date +%Y%m%d%H%M)
    borg create "$REPO"::backup-$TIMESTAMP $(cat "$WATCHLIST")
}

backup_archive() {
    local dest='/tmp/borg-repo-backup.tar.gz'
    if [ ! -z "$1" ]; then
        dest="$1"
    fi
    echo "Creating tar $dest"
    tar -czvf $dest $REPO
}

backup_clean() {
    borg prune --show-rc --keep-daily 7 --keep-weekly 2 --keep-monthly 2 --list $REPO
    borg compact $REPO
}

print_config() {
    echo "REPO: $REPO"
    echo "WATCHLIST: $WATCHLIST"
}


# Parse optional arguments
while [[ "$1" == --* ]]; do
  case "$1" in
    -r|--repo)
      REPO="$2"
      shift 2
      ;;
    -w|--watchlist)
      WATCHLIST="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

REPO="${REPO:-$BORG_BACKUP_REPO}"
WATCHLIST="${WATCHLIST:-$BORG_BACKUP_WATCHLIST}"
WATCHLIST="${WATCHLIST:-$HOME/.borg_watchlist}"

touch "$WATCHLIST"


case "$1" in
  now)
    backup_borg $1
    ;;
  add)
    backup_add "$2"
    ;;
  archive)
    backup_archive "$2"
    ;;
  config)
    print_config
    ;;
  clean)
    backup_clean
    ;;
  *)
    echo "Usage: $0 {now|add|archive|config}"
    echo "Helper script to run borg backup commands"
    echo "$0 now -> back up the current $BORG_BACKUP_WATCHLIST"
    echo "$0 add -> adds a file or directory to the current $BORG_BACKUP_WATCHLIST"
    echo "$0 archive -> creates a tar archive of $BORG_BACKUP_REPO"
    echo "$0 config -> prints script variables"
    ;;
esac
