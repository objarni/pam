# This Makefile assumes there is an environment named DUT
# which specifies the name of the module under test
# Example command line:
#   DUT=rabbit make test

.PHONY: test lci cover mutate freeze clean install-things

DUTPY=dut/${DUT}.py
TESTPY=dut/test_${DUT}.py
ENV=env/bin/activate

${ENV}:
	python3 -m venv env

install-things:
	sudo apt install meld entr surf

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
	( . ${ENV} && pytest ${TESTPY} )

cover:
	( . ${ENV} && \
		coverage run --include=${DUTPY} ${TESTPY} && \
		coverage report && \
		coverage html && \
		surf htmlcov/index.html )

lci:
	( . ${ENV} && ls ${DUTPY} ${TESTPY} | entr -c make test )


mutate:
	( . ${ENV} && \
		cosmic-ray init cosmic.toml cosmic.sqlite && \
		cosmic-ray exec cosmic.sqlite && \
		cr-html cosmic.sqlite >cosmic.html )
