## This document is shortcut guide for starknet beginner used m1(mac).

# Setup the python
## There are cases where python versions installed in m1 collide and a problem occurs. Remove Pythons installed by brew and reinstall them.
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
# Setup the enviroment
```
$ python3 -m venv ~/cairo_venv
$ source ~/cairo_venv/bin/activate
```

## 1. On Mac, you can use brew:
```
cairo_venv ❯ brew install gmp
```
## 2. Install the cairo-lang python package using:
```
cairo_venv ❯ pip3 install marshmallow-dataclass==8.5.3 --force
```
```
cairo_venv ❯ pip3 install cairo-lang==0.8.1
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
cairo_venv ❯ cairo-compile test.cairo --output test_compiled.json
```
## 3. Run:
```
cairo_venv ❯ cairo-run \
  --program=test_compiled.json --print_output \
  --print_info --relocate_prints
```
## 4. You can open the Cairo tracer by providing the --tracer flag to cairo-run. Then open it at http://localhost:8100/.

# Done
