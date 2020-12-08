#!/bin/bash
set -e

./make-env.sh
source .venv/bin/activate
pip install -r requirements-lock.txt

python setup.py develop

jupyter nbextension enable --py --sys-prefix widgetsnbextension

jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter lab build

jupyter lab ./notebooks
