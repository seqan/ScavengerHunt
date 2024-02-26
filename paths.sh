# SPDX-FileCopyrightText: 2006-2024 Knut Reinert & Freie Universität Berlin
# SPDX-FileCopyrightText: 2016-2024 Knut Reinert & MPI für molekulare Genetik
# SPDX-License-Identifier: BSD-3-Clause
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
