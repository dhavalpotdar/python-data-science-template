install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=src --cov=lib tests/test_*.py

format:	
	black src/*.py lib/*.py tests/*.py

lint:
	pylint --disable=R,C src/*.py lib/*.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#deploy goes here
		
all: install lint test format deploy