pam
===
Python ApprovalTests **Makefile** and utility script **pam.py**.

A minimal Makefile to ease practicing Approval Testing in Python.


Usage
-----
Given files **rabbit.py** and **test_rabbit.py** with content as below, copied to **pam/** folder, cloned from github, then
the expected behaviour is something like this:

    $ pwd
    /home/olof/github/pam

    $ cat rabbit.py

    def fn(x):
        return x * 2

    $ cat test_rabbit.py

    from pam import verify
    from rabbit import fn


    def test():
        args = [
          [0, 1, 2]
        ]
        verify(fn, args)

    $ DUT=rabbit make test
  
.. this will create a virtual environment and run approval test (ApprovalTest.Python) on the rabbit module. DUT stands for "Device Under Test".

Some make targets available are:

    make clean   # remove all artifacts built by make
    make test    # create a Python 3 virtual environment including pytest, coverage approvaltests
    make lci     # run a 'local CI' loop detecting any modifications to DUT code

There are also a couple of w.i.p targets:

    make cover   # produce a HTML coverage report
    make mutate  # run cosmic ray mutation testing on DUT
