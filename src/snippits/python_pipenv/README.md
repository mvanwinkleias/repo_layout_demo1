# Python, Pipenv, and Symbolic Links

The layout I use is compatible with pipenv.

In the project directory (the one that contains src) run:
```
pipenv install
git add Pipfile Pipfile.lock
git commit -m 'pipenv'
# etc
```

## Checking in Pipfile.lock

This says you should do it:

* https://github.com/pypa/pipenv/issues/598


For more information, see:

* https://docs.python-guide.org/dev/virtualenvs/

## Running a Script that's been symbolically linked

**run_pipenv.sh** in this directory shows how it can be done.
