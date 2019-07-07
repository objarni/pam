pam
===
**P**ython **A**pprovalTests **M**akefile and utility script **pam.py**.

A minimal Makefile to ease practicing Approval Testing in Python.


Usage
-----
Given files **rabbit.py** and **test_rabbit.py** with content as below, copied to **pam/dut** folder, cloned from github, then
the expected behaviour is something like this:

    $ pwd
    /home/olof/github/pam

    $ cat dut/rabbit.py

    def fn(x):
        return x * 2

    $ cat dut/test_rabbit.py

    from pam import verify
    from rabbit import fn


    def test():
        args = [
          [0, 1, 2]
        ]
        verify(fn, args)

    $ DUT=rabbit make test
  
.. this will create a virtual environment, with [ApprovalTests.Python](https://github.com/approvals/ApprovalTests.Python) and more installed, and run pytest on **test_rabbit.py** (which tests **rabbit.py**). **DUT** stands for "**D**evice **U**nder **T**est".


These make targets are documented and 'production ready':

    make install-things     # install help tools (meld, entr, surf)
    DUT=<name> make test    # create a Python 3 virtual environment
                            # including pytest, coverage and approvaltests
                            # in ./env/ (if it does not already exist)
                            # and run tests of DUT.

    make clean              # remove all artifacts built by make


There are also a couple of w.i.p targets which needs better UX (currently implicit dependencies e.g):

    DUT=<name> make cover   # produce a HTML coverage report for <name>

    DUT=<name> make lci     # run a 'local continuous integration ' loop which
                            # detect modifications of DUT code and re-runs test(s)

    DUT=<name> make mutate  # run cosmic ray mutation testing on DUT
