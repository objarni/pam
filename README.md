pam
===
Python ApprovalTests **Makefile** and utility script **pam.py**.

A minimal Makefile to ease practicing Approval Testing in Python.


Usage
-----
Given files rabbit.py and test_rabbit.py with content as below, copied to pam/ folder, cloned from github, then
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
  
.. this will create a virtual environment and run approval test (ApprovalTest.Python) on the rabbit module.

