pam
===
Python ApprovalTests Makefile (p.a.m.).

A minimal Makefile to ease practicing Approval Testing in Python.


Usage
-----
Given files rabbit.py and test_rabbit.py and copy them to pam/ (cloned from github):

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
    $ make test
  
.. this will create a virtual environment and run the test.
