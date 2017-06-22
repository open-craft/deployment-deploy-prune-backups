# Tarsnapper pruner server

Deploys a high-security server, has full access to most our tarsnapper backups.
This server is used only to delete old backups.

How to deploy
-------------

`ansible-playbook deploy/deploy-all.yml -u ubuntu --extra-vars @private-extra-vars.yml -i hosts --private-key /path/to/backup_pruner.key`

How to add new backup to be pruned
----------------------------------

1. Get master key
2. Save master key to private.yml
3. Save cache directory and file for tarsnap key in the private yaml
4. Add new entry to `TARSNAPPER_JOBS`

How to prune backups for individual servers
-------------------------------------------

1. Login to the instance
2. Pruning scripts are named `tarsnap-{{ job.name }}.sh`
3. Following operations are supported:
   a. List archives `sudo tarsnap-{{ job.name }}.sh list`
   b. Expire archives `sudo tarsnap-{{ job.name }}.sh. expire`
   c. Expire archives (dry run) `tarsnap-{{ job.name }}.sh expire --dry-run`
