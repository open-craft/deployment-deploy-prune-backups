#jinja2: trim_blocks:False
#!/bin/bash
# This script runs all of the backup pruners in parallel, returning the output
# of only the failing pruners.
# Check {{ JOB_LOG }} for a summary of the most recent pruner run.
set -e

jobs='{% for item in TARSNAPPER_JOBS %}
{{ item.name }}{% endfor %}'

# Buffer the output of each pruner per-task; if the pruner fails, forward along the
# output to GNU Parallel, which will then simply forward the output along to cron.
task='output=$(/usr/local/sbin/tarsnap-{}.sh expire 2>&1) || echo "$output"'
# Cron will send email if there is any stdout or stderr output regardless of the
# response code, so by only including output for failed tasks in the output, an
# email will only be sent out if and only if one or more backup pruners failed.
echo "$jobs" | tail -n +2 | parallel --no-notice -j0 --joblog {{ JOB_LOG }} $task
