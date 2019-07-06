# This Makefile assumes there is an environment named DUT
# which specifies the name of the module under test
# Example command line:
#   DUT=rabbit make test

.PHONY: test lci cover mutate freeze clean

DUTPY=${DUT}.py
TESTPY=test_${DUT}.py
ENV=env/bin/activate

${ENV}:
	python3 -m venv env

devenv: ${ENV}
	( . ${ENV} && pip install approvaltests coverage pytest )
	touch devenv

clean:
	rm -rf env
	rm -rf __pycache__
	rm -rf cosmic.*
	rm devenv

freeze: devenv
	( . ${ENV} && pip freeze )

test: devenv
	( . ${ENV} && USE_MELD=1 NOSE_REDNOSE=1 pytest ${TESTPY} )

lci:
	( . ${ENV} && ls ${DUTPY} ${TESTPY} | entr -c make test )

cover:
	( . ${ENV} && \
		coverage run --include=${DUTPY} ${TESTPY} && \
		coverage report && \
		coverage html && \
		surf htmlcov/index.html )

mutate:
	( . ${ENV} && \
		cosmic-ray init cosmic.toml cosmic.sqlite && \
		cosmic-ray exec cosmic.sqlite && \
		cr-html cosmic.sqlite >cosmic.html )
