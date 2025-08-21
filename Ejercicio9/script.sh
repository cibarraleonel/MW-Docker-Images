set -e
ls /not-exist
echo "Sigo ejecutando"

set -e
ls /not-exist | echo "No problem"
echo "Sigo ejecutando"

set -eo pipefail
ls /not-exist | echo "No problem"
echo "Sigo ejecutando"
