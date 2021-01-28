# wolfram-engine-desktop-linux

## TLDR
1. https://account.wolfram.com/access/wolfram-engine/free?operatingSystem=LINUX
2.
```bash
echo -n $'YOUR-WOLFRAM-ID-EMAIL@HERE.com\nYOUR-WOLFRAM-ID-PASSWORD-HERE\n' | sudo docker run --name my-wolfram-engine-container -i wolframlanguagefan/wolfram-engine-desktop-linux:latest
sudo docker commit my-wolfram-engine-container my-wolfram-engine-image

sudo docker run --rm -ti my-wolfram-engine-image
```

## Description
A containerized version of the Free Wolfram Engine for Developers https://www.wolfram.com/engine/,
more specifically the binary downloadable from https://account.wolfram.com/download/public/wolfram-engine/desktop/LINUX

Built from these instructions: https://mathematica.stackexchange.com/a/173662/76995

This repository contains the source Dockerfile for automatically building https://hub.docker.com/r/wolframlanguagefan/wolfram-engine-desktop-linux, available via

```
docker pull wolframlanguagefan/wolfram-engine-desktop-linux
```

## Instructions

```bash
# OPTIONAL: if you want to build the base image yourself,
# clone this repository, cd into this folder, then do
sudo docker build -t wolframlanguagefan/wolfram-engine-desktop-linux:latest .

# Visit
#   https://account.wolfram.com/access/wolfram-engine/free?operatingSystem=LINUX
#   OR https://www.wolfram.com/engine/ and press Linux, cancel the download and press "Get your license"
# and create or/and log in (with) your Wolfram Account/Wolfram ID
#
# Press "Get license".
# You should see
# > Your license has been created.
# Your account can now be used to activate wolfram-engine.
#
# License Note from Wolfram Research, Inc.:
# > The Free Wolfram Engine for Developers is available for non-production software development.
#
# Then:
# Run wolfram-engine for the first time & 
# Enter your Wolfram ID and the associated password to complete activation. (as outlined in https://support.wolfram.com/46072).
#
# Instead of doing it interactively, here we do it in a scriptable fashion.
# It should say
# > Wolfram Engine activated. See https://www.wolfram.com/wolframscript/ for more information.

echo -n $'YOUR-WOLFRAM-ID-EMAIL@HERE.com\nYOUR-WOLFRAM-ID-PASSWORD-HERE\n' | sudo docker run --name my-wolfram-engine-container -i wolframlanguagefan/wolfram-engine-desktop-linux:latest
sudo docker commit my-wolfram-engine-container my-wolfram-engine-image

# From now on, you can run an interactive session of your registered & activated wolfram-engine with

sudo docker run --rm -ti my-wolfram-engine-image

# > Wolfram Language 12.2.0 Engine for Linux x86 (64-bit)
# > Copyright 1988-2021 Wolfram Research, Inc.
# > 
# > In[1]:= Solve[a*x^2 + b*x + c == 0, x] //InputForm
# > 
# > Out[1]//InputForm= {{x -> (-b - Sqrt[b^2 - 4*a*c])/(2*a)}, {x -> (-b + Sqrt[b^2 - 4*a*c])/(2*a)}}
```

# Disclaimer
This container is build and provided as is with no warranty. The copyright holder for these instructions is no one, the wolfram-engine binary inside the container and the activated `my-wolfram-engine-image` that you build by following these instructions is licensed to you by Wolfram Research, Inc.

The same rights apply as if you downloaded and activated this software on your desktop.

# See
* https://hub.docker.com/r/wolframlanguagefan/wolfram-engine-desktop-linux
* https://mathematica.stackexchange.com/questions/134637/running-mathematica-on-docker/238847#238847