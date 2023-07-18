# kernel-scripts
A collection of curated scripts for kernel-related devops.

### Workflow
Typical usage starts out with running `create-image.sh` to create an image, then running it using `run.sh`. Once the kernel is live, one can use the other scripts like `ssh.sh` and `gdb.sh` to interact. 


### Scripts
| Name | Description | 
|-|-|
| [`create-image.sh`](create-image.sh) | Creates an qemu disk image for debugging purposes, using [Syzkaller's script](https://github.com/google/syzkaller/blob/master/tools/create-image.sh): `./create-image.sh` |
| [`gdb.sh`](gdb.sh) | Sets up an GDB session for the debugged kernel: `./gdb.sh <kernel_dir>`. |
| [`run_kmod.sh`](run_kmod.sh) | Starts a kernel module through ssh: `./run_kmod.sh <kmod_name> <kmod_path>`. |
| [`run_python.sh`](run_python.sh) | Runs a python script (with stdout) through ssh: `./run_python.sh <file_path>` |
| [`run.sh`](run.sh) | Runs a kernel in QEMU with GDB server (port: 1234) and SSH (port: 10021): `./run.sh <kernel_dir>` |
| [`ssh.sh`](ssh.sh) | Starts an SSH session, with possible command: `./ssh.sh [command]` |
