---
title: Bash Config
slug: bashrc
summary: Useful settings for .bashrc
weight: 3
---

# Useful settings for .bashrc

## Aliases

These aliases prevent you from accidentally overwriting or deleting files.

```bash
cat >> ~/.bashrc <<- EOM
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
EOM
```

## Set language to English

```bash
echo "export LANG=en_US.utf8" >> ~/.bashrc
```

## Use colors

```bash
sed -i 's@#force_color_prompt=yes@force_color_prompt=yes@' ~/.bashrc
```

## Use colors for GCC

```bash
cat >> ~/.bashrc <<- EOM
# colored GCC warnings and errors
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:range1=32:range2=34:locus=01:quote=01:path=01;36:fixit-insert=32:fixit-delete=31:diff-filename=01:diff-hunk=32:diff-delete=31:diff-insert=32:type-diff=01;32"
EOM
```

## Make flags

```bash
cat >> ~/.bashrc <<- EOM
# Run make in parallel by default, do not report directory switching, and synchronise messages
export MAKEFLAGS="-j$(($(nproc) / 2)) --no-print-directory --output-sync=target"
export GNUMAKEFLAGS="-j$(($(nproc) / 2)) --no-print-directory --output-sync=target"
EOM
```

## GPG password prompt

If you are signing commits with GPG, `GPG_TTY` tells GPG where to display the password prompt.

```bash
echo "export GPG_TTY=$(tty)" >> ~/.bashrc
```
