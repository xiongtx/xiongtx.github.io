---
layout: post
title: Runnying Jupyter server on Windows
excerpt: Maybe I should have just installed Linux
---

I have a Windows machine with an RTX 3090, which I'd like to use for some local AI training. I still want to run the notebook on my MacBook, however. Here's what I had to do to make that happen.

## CUDA

For stability, install Nvidia Studio [driver](https://www.nvidia.com/en-us/drivers/) instead of Game Ready. It's the same tech stack, but Studio is more stable. Restart the computer afterwards.

Made this change after seeing a Jupyter kernel crash & restart:

```
[I 2026-01-09 09:37:14.194 ServerApp] Uploading file to /252_28238_29-pycharm-support-libs.zip
[I 2026-01-09 13:07:44.389 ServerApp] AsyncIOLoopKernelRestarter: restarting kernel (1/5), keep random ports
[W 2026-01-09 13:07:44.390 ServerApp] kernel 2fb85dd2-84c3-49dc-9395-26c8dfdbee4b restarted
```

Checked in Windos [Event Viewer](https://learn.microsoft.com/en-us/shows/inside/event-viewer) for an error:

```
Faulting application name: python.exe, version: 3.11.8150.1013, time stamp: 0x65c2ad47
Faulting module name: c10_cuda.dll, version: 0.0.0.0, time stamp: 0x67185a9f
Exception code: 0xc0000005
Fault offset: 0x0000000000021a5d
Faulting process id: 0x3dd8
Faulting application start time: 0x01dc818e95dab2f7
Faulting application path: C:\Python311\python.exe
Faulting module path: C:\venvs\jupy\Lib\site-packages\torch\lib\c10_cuda.dll
Report Id: f10c260f-be0b-4d0b-b829-f0e3fda6b08a
Faulting package full name:
Faulting package-relative application ID:
```

## Python

First, check CUDA version with `nvidia-smi`:

```
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 566.03                 Driver Version: 566.03         CUDA Version: 12.7     |
|-----------------------------------------+------------------------+----------------------+
```

Need to install a CUDA-enabled version of [`torch`](https://download.pytorch.org/whl/torch/) from the right index, `https://download.pytorch.org/whl/cu121`[^1]. No compatible `torch` wheel existed for Python 3.13, which we already had. So [installed](https://chocolatey.org/) 3.11:

```
choco install python --version=3.11.8 -y
```

Then created a [virtual environment](https://docs.python.org/3/library/venv.html) called `jupy` for installing dependencies:

```
py -3.11 -m venv C:\venvs\jupy
```

Activate the venv:

```
C:\venvs\jupy\Scripts\Activate.ps1
```

Then install `ipykernel`:

```
pip install ipykernel
```

and register the kernel:

```
python -m ipykernel --user --name jupy --display-name "Python (jupy)"
```

## Jupyter

Clone the GitHub repo you want to work in. It's easier if the server is started in that directory.

Use a password to access the server. Run:

```
jupyter notebook password
```

Set the HuggingFace token as environment variable `HF_TOKEN`. Start a new PowerShell window. Start the server:

```
jupyter notebook --ip=0.0.0.0 --no-browser
```

Find the Windows machine's IP address:

```
ipconfig
```

```
Wireless LAN adapter Wi-Fi:
   ...
   IPv4 Address. . . . . . . . . . . : 192.168.10.104
   ...
```

On the Mac, go to `System Settings` > `Privacy & Security` > `Local Network` and enable Chrome / Pycharm to communicate with devices on local network. Then go to `http://192.168.10.104:8888` and see that the server is accessible.

## PyCharm

In PyCharm, go to `Jupyter Servers` and add a new server. Choose `Notebook/Lab`, provide URl and password. Test connection to verify it works. Connect to server and switch to `jupy` kernel.

When installing dependencies, use `{sys.executable}` to use the Python executable in the virtual env:

```
import sys
!{sys.executable} -m pip install torch --index-url https://download.pytorch.org/whl/cu121
!{sys.executable} -m pip install transformers datasets peft accelerate
```

## Footnotes

[^1]: `cu121` stands for CUDA 12.1, which is compatible w/ 12.7.
