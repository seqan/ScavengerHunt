---
title: SSH
slug: ssh
url: ssh
summary: Setting up SSH
weight: 1
---

# Setting up SSH

## Introduction

SSH (Secure Shell) is a cryptographic network protocol for operating network services securely over an
unsecured network. It provides a secure channel over an unsecured network by encrypting the communication
between the client and server.

## ZEDAT Account

You need a ZEDAT account that is registered with the Fachbereich.\
To make sure your account is activated, please log in into https://portal.mi.fu-berlin.de once. You may need to wait up to an hour.

## Installing SSH Client

* **Linux**: ssh should be installed. If not, run: sudo apt install openssh-client
* **Mac**: ssh should be installed.
* **Windows**: Install WSL (Windows Subsystem for Linux). ssh should then be available in WSL.

## Setting Up Your ssh Config

In your terminal, type:

```bash
mkdir -p ~/.ssh
touch ~/.ssh/config
chmod 600 ~/.ssh/config
nano ~/.ssh/config
```

This will open a file.\
Now copy the following into this file and replace <USER> with your ZEDAT username.

```
Host sanmarino andorra
    Hostname %h.imp.fu-berlin.de
    User <USER>

Host compute?? cuda??
    HostName %h.imp.fu-berlin.de
    ProxyJump andorra
    User <USER>
```

Save and exit nano (`<ctrl-o>`, `<enter>`, `<ctrl-x>`).

## Connecting to the FU Server

After setting up your config, type:

```bash
ssh compute01
```

If you are connecting for the first time, you will see a message asking you whether you trust the server.\
Type `yes` and press `<enter>` to continue connecting.\
You are also asked for your ZEDAT password. Maybe even multiple times.

## Connecting to the Servers with an ssh Key Pair

There are still two issues left to solve:
* You always have to type in your password (that’s a waste of time)
* You cannot log in if you are not connected to eduroam.

To overcome these issues, we need to generate an ssh key pair.

### Checking whether you already have an ssh key pair

Type the following in your terminal:
```bash
ls ~/.ssh
```
It should print at least the config file we created, and might show this:
```
config id_rsa id_rsa.pub
```
If you see a file that ends with .pub, you already have an ssh key that you can reuse.\
**If you already have an ssh key, the next step!**

### Creating an ssh key

Type into your terminal:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
The string after `-C` is a comment for your key that you can freely choose.\
If you are asked for a passphrase, just press `<enter>`.\
Otherwise, you will have to enter your ssh key password each time you want to use it.

### Copy the ssh-key to the server

Type into your terminal:
```bash
ssh-copy-id andorra
```
Type in your ZEDAT password if requested to do so.

You should now be able to log in to the servers from everywhere without entering your password every time.

If you are using an already exsting ssh key and it is not used by default, you need to extend the `~/.ssh/config`:
```
    IdentityFile <file_to_exting_ssh_key>
```
