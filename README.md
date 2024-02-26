<!--
    SPDX-FileCopyrightText: 2006-2024 Knut Reinert & Freie Universität Berlin
    SPDX-FileCopyrightText: 2016-2024 Knut Reinert & MPI für molekulare Genetik
    SPDX-License-Identifier: CC-BY-4.0
-->

# Scavanger Hunt

## Goals
1. Wie komme ich auf den Server? (Frontal)[30min]<Simon>
    + connection to FU-Servers (how the fu world is setup)
    + ssh
    + scp
    + including ssh-keygen/ssh-copy-id
    + .ssh/config -> proxyjump

2. Was kann ein Server, Wie finde mich zurecht? (Frontal)[30min]<Simon>
    + htop
    + whoami
    + uname -a
    + tmux,screen,nohup
    + Important shortcuts:
        - Tab-Completion
        - Ctrl-Shift-V/Ctrl-Shift-C
        - Middle mouse button
        - Ctrl-C - terminates the current program (yes)
        - Ctrl-D - sends end of file signal
        - Ctrl-R - Reverse history search
        - Ctrl-L - Clear terminal
        - bash: Ctrl-Q (Ctrl-S freezes the screen)

3. Scavanger Hunt (Interactive)[60min]<Svenja>
    - Navigation auf dem Server?
        + cd
        + ls -la
        + pwd
    - Filemanagement
        + mkdir,rmdir
        + mv,cp
        + touch,rm
        + chmod, chown (?)
    - Viewing and Editing Files
        + cat, zcat
        + less, zless, more
    - Data Manipulation
        + echo
        + diff
        + head
        + tail
        + cut
        + tr
        + sed
        + awk
        + grep,zgrep
        + find
        + ack
        + sort
        + uniq
        + wc
        + yes
        + column -t
        + rev
        + tac
    - Data Download
        + wget,curl
        + git clone

4. Tools (Frontal)[30min]
    + vim,nano,emacs
    + zsh
    + cd -
    + fzf,autojump,autojump-nachfolger
    + conda,python-env
    + sudo,su
    + jq,yq,xq,tq
    + tar,gzip,zip,xz,zstd
    + jobs,fg,bg, Ctrl-Z
    + df,du,quota
    + parallel,xargs
