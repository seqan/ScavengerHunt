---
title: Scavenger Hunt
slug: scavenger_hunt
summary: Scavenger Hunt
weight: 4
---

# Scavenger Hunt

You are provided with a zip file that needs a password to be extracted.
The extracted file again containt a zip file that needs a password to be extracted.
This process continues until you reach the final file.

Besides the zip files, each level contains
* a `README.txt` that describes where to find the password
* a `password.txt` yields the password for the next level when processed according to the instructions in the `README.txt`
* a `hint.txt` that gives some hints on what commands to use

When trying to extract the zip file (`unzip file.zip`), you will be prompted for a password.\
Alternatively, you can use `unzip -P "password" file.zip` to extract the file.\
To suppress the output, you can additionally pass `-q` to the command.

The first file is provided below.

Link: [{{< absurl start.zip >}}]({{< absurl start.zip >}})\
Password: `go`

```bash
wget {{< absurl start.zip >}}
unzip -P "go" start.zip
```

