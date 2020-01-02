# makefile for python3 src experiments
# 20191227 fekerr@gmail.com
# 20200102

pysrc=build.py
allsrc=${pysrc} makefile requirements_.txt

all: ${allsrc}
	echo "Hello, all:"
	python -V
	pip --version
	pyflakes --version
	pycodestyle --version
	pyflakes ${pysrc}
	pycodestyle ${pysrc}

# dying breed
pep8: ${allsrc}
	pep8 ${pysrc}

pycodestyle: ${allsrc}
	pycodestyle ${pysrc}

pyflakes: ${allsrc}
	pyflakes ${pysrc}

requirements_.txt: ${pysrc} makefile
	pip freeze --local | grep -v myapp > requirements_.txt

run:
	echo "echo run it yourself: ./build.py"
