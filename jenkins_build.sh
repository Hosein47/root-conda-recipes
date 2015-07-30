#!/bin/bash

if [ ! -f Miniconda-latest-Linux-x86_64.sh ]; then
        wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
fi
bash Miniconda-latest-Linux-x86_64.sh -b -p conda
. conda/bin/activate root
#echo $PATH
conda update --yes -q conda
conda update --yes --all
conda config --add channels http://conda.binstar.org/remenska
conda config --add channels http://conda.binstar.org/richli
conda config --add channels http://conda.binstar.org/asmeurer
conda config --add channels http://conda.binstar.org/mhworth #new 
conda config --add channels http://conda.binstar.org/ostrokach #new
conda config --add channels defaults
conda config --add channels http://conda.binstar.org/jsw-fnal
conda install --yes -q conda-build
conda install --yes jinja2
# if [ $ROOT = 5 && $PYTHON = 3 ]; then
#    PY=py34
# elif [ $ROOT = 6 && $PYTHON = 3 ]; then
#    PY=py23
# else
#    PY=""
# fi

#conda build --yes -q root$ROOT$PY

CONDA_PY=$CONDA_PY conda build ~/git/conda-recipes/root$ROOT

#binstar -t $BINSTAR_TOKEN upload --force -u omnia -p yank-dev $HOME/miniconda/conda-bld/*/yank-dev-*.tar.bz2
#binstar upload /data/workspace/root-mirror/PYTHON/2/ROOT/5/conda/conda-bld/linux-64/root-5.34.32-py27_gcc4.8.tar.bz2