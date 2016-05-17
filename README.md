# Tarsnapper pruner server

Deploys a high-security server, has full access to most our tarsnapper backups. 
This server is used only to delete old backups. 

How to deploy
-------------

1. Set IP in hosts 
2. Download vault password 
3. `deploy-all.yaml -u admin --vault-password-file .vault-pass`

How to add new backup to be pruned
----------------------------------

1. Get master key
2. Save master key to private.yml
3. Save cache directory and file for tarsnap key in the private yaml 
4. Add new entry to `keys_to_upload`
5. Add new entry to `TARSNAPPER_CONFIG_CONTENTS.jobs`
6. Keep in mind that `keys_to_upload[0].name` must correspond to a key of 
   `TARSNAPPER_CONFIG_CONTENTS.jobs`. That is if there is an entry with `name` foo
   there needs to be `TARSNAPPER_CONFIG_CONTENTS.jobs.name`

How to prune backups
--------------------

1. Login to the instance 
2. `sudo prune-{{backup.name}}.sh`, for example  
