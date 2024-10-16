install:
	python3 -m pip install --upgrade pip &&\
	python3 -m pip install -r requirements.txt


test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	python3 -m pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
