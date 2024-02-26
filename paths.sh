set -u

if [ "$0" = "$BASH_SOURCE" ]; then
    echo "$0: This script must be sourced, not executed."
    exit 1
fi

if [ "" = "$SCRIPT_ROOT" ]; then
    echo "$0: SCRIPT_ROOT cannot be empty."
    exit 1
fi

PATH_LEVEL_0="${SCRIPT_ROOT}/start"
for i in $(seq 1 1 15); do
    eval "PATH_LEVEL_${i}=\${PATH_LEVEL_$((i-1))}/level${i}";
done
PATH_END_BOSS="${PATH_LEVEL_15}/end_boss"
