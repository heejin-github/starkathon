# Newbie guide to setup Cairo environment

This document is shortcut guide for starknet beginner using M1 Mac.


## Why we write this guide

We have followed this [guide](https://www.cairo-lang.org/docs/quickstart.html) provided by Starkathon [Preparing to Work with the StarkNet Hackathon Env.](https://starkware.notion.site/Preparing-to-Work-with-the-StarkNet-Hackathon-Env-dcb7b2a0ba8e48059b5c48d5d8301cb3).

And found out it assumes that participants already have working python environments.
In this guide, we describe a way to setup StarkNet environment for those who have no python envronment.

# Setup python environment

There are cases where python versions installed in M1 collide and a problem occurs. Remove Pythons installed by brew and reinstall them.
```
$ brew list
$ brew uninstall <python version> --ignore-dependencies
```

## Add the following syntax to the bottom of .zshrc.
```
export LANG="en_US.UTF-8"
```

## Install the python
```
$ brew install python3
```

## Update pip and then set up a working Cairo virtual environment. 

```
$ CFLAGS=-I`brew --prefix gmp`/include LDFLAGS=-L`brew --prefix gmp`/lib pip3 install ecdsa fastecdsa sympy
```

# Setting up the environment for Cairo

```
$ python3 -m venv ~/cairo_venv
$ source ~/cairo_venv/bin/activate
```

## 1. On Mac, you can use brew:
```
(cairo_venv) $ brew install gmp
```

## 2. Install the cairo-lang python package using:

You have to use 8.5.3 version of marshmallow-dataclass.

```
(cairo_venv) $ pip3 install marshmallow-dataclass==8.5.3 --force
```

You have to use 0.8.1 version of cairo-lang.
```
(cairo_venv) $ pip3 install cairo-lang==0.8.1
```

# Compile and Running a Cairo program
## 1. Create a file, named test.cairo, with the following lines:
```
func main():
    [ap] = 1000; ap++
    [ap] = 2000; ap++
    [ap] = [ap - 2] + [ap - 1]; ap++
    ret
end
```

## 2. Compile: (make sure all commands are executed in the virtual environment)
```
(cairo_venv) $ cairo-compile test.cairo --output test_compiled.json
```

## 3. Run:

```
(cairo_venv) $ cairo-run \
  --program=test_compiled.json --print_output \
  --print_info --relocate_prints
```

## 4. Run with tracer
You can open the Cairo tracer by providing the --tracer flag to cairo-run. Then open it at http://localhost:8100/.

```
(cairo_venv) $ cairo-run \
   --program=test_compiled.json --print_output \
   --print_info --relocate_prints --tracer
Number of steps: 4 (originally, 4)
Used memory cells: 11
Register values after execution:
pc = 12
ap = 12
fp = 12

Running tracer on http://localhost:8100/
```

Now open browser and visit `http://localhost:8100` to use tracer.

You can find tracer looks like below.
![tracer](https://raw.githubusercontent.com/heejin-github/starkathon/main/tracer.png)

Congratulation! Now you have a working Cario environment.
