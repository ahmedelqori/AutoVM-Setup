# AutoVM-Setup

A simple and customizable Bash script for setting up VirtualBox virtual machines automatically. This tool provides an easy way to create VMs with pre-defined configurations, saving time and ensuring consistency across environments.

## [Features](#features)

## [Prerequisites](#prerequisites)

## [Installation](#installation)

### Features

- Customizable memory, CPU count, and VRAM settings.
- Optional 3D acceleration and audio support.
- Configurable boot order for each VM.
- Automatically installs all popular tools and setup your desktop.

### Prerequisites

- [VirtualBox](https://www.virtualbox.org/) installed
- Bash shell (available on macOS, Linux, or Windows via WSL)
- Python3 for server hosting
- Make for run project

### Installation

#### 1- Clone this repository:

```bash
git clone https://github.com/ahmedelqori/AutoVM-Setup.git
cd AutoVM-Setup
```

#### 2- Change Env Variables:

```bash
    vim .env || code .env
    - Change all you need
```

```bash
# Name Of Your VM
    NAME=meedivo
# Size with megabytes
    SIZE=40000
# Number of cores
    CPU=10
# RAM with megabytes
    RAM=10240
# Virtual Memory with mb
    VRAM=128
# Path of your vm
    PATH=/goinfre/ael-qori
# Path of your iso
    ISO=/goinfre/ael-qori/iso/ubuntu.iso
```

#### 3- Change Yaml:

- Change Here hostname and username and put hashedpassword of your password use that https://mkpasswd.stravers.net/
  ![yaml_1](imgs/yaml_1.png)
- Here just update name with username you set before
  ![yaml_2](imgs/yaml_2.png)

#### 4- Make Project

![make project](imgs/make.png)

```
    http://[your_ip]:1337/install.yaml # this url for automate installaion
```

#### 5- Make File

```bash
# use for help
        make help
# for logs
        make log
# for start server
        make server
# for create vm
        make VBOX
# for remove logs
        make clean
```

#### 6- Steps

![step_1](imgs/step_1.png)
![step_2](imgs/step_2.png)
![step_3](imgs/step_3.png)
![step_4](imgs/step_4.png)
![step_5](imgs/step_5.png)
![step_6](imgs/step_6.png)

- Use URL in Terminal where u run make of run `make SERVER` and use first link
  ![step_7](imgs/step_7.png)
  ![step_8](imgs/step_8.png)

4. install packages

- Password in make case is `password: 1`
  ![step_9](imgs/step_9.png)
- look at teminal where u run make and use the URL for packages
  ![step_10](imgs/step_10.png)
- look at teminal where u run make and use the URL for Desktop
  ![step_12](imgs/step_12.png)
- Result
  ![result](imgs/step_13.png)
