###########
# Setup a basic click environment
###########
import os
import subprocess
import sys


if sys.version_info < (3,0):
    print("Please use Python3")
    sys.exit(1)
else:
    try:
        from pathlib import Path
        import venv
    except ImportError as err:
        print("""Virtualenv is not installed.
Install with: sudo apt-get install pyvenv-3.4""")
        sys.exit(1)


def setup_dirs():
    try:
        service_name=sys.argv[1]
    except Exception as err:
        print("USAGE: setupvenv <product name>")
        sys.exit(1)
    basedir = os.path.join(os.getcwd(), service_name)
    codedir = os.path.join(basedir, "src", service_name)
    try:
        os.makedirs(os.path.join(codedir))
    except FileExistsError as err:
        print("Virtual Environment Exists already")
        sys.exit(1)

    template_cli = """import click


@click.group(invoke_without_command=True, help="Click template for the {:s} command")
@click.pass_context
def cli(ctx):
  ctx.global_vars = ctx
  click.secho("You did it!", fg="green")


@cli.command("show", help="shows if the parsed flag was invoked")
@click.option("--parsed", is_flag=True)
@click.pass_context
def show(ctx, parsed):
  if parsed:
      click.secho("You set the flag")
  else:
      click.secho("Nothing is set")
    """.format(service_name)

    template_setuptools = """from setuptools import setup


setup(
    name='{service}',
    version='0.1',
    py_modules=['{service}'],
    install_requires=[
        'Click',
    ],
    entry_points='''
        [console_scripts]
        {service}={service}:cli
    ''',
)
    """.format(service=service_name)

    with open(os.path.join(codedir, service_name + ".py"), "w+") as f:
        f.write(template_cli)
    with open(os.path.join(codedir, "setup.py"), "w+") as f:
        f.write(template_setuptools)
    return ({
        'basedir': basedir,
        'codedir': codedir,
        'service_name' : service_name
    })


def init_venv(dirs):
    virtualenv = venv.create(dirs['basedir'], with_pip=True)
    os.symlink(os.path.join(dirs['basedir'], "bin", "activate"), os.path.join(dirs['codedir'], "activate"))


def setup_pip(dirs):
    pip_path = os.path.join(dirs['basedir'], "bin", "pip")
    subprocess.call([pip_path + " install click"], shell=True)
    os.chdir(dirs['codedir'])
    subprocess.call(["{pip_path} install --editable {codepath}".format(pip_path=pip_path, codepath=dirs['codedir'])], shell=True)


if __name__ == "__main__":
    dirs = setup_dirs()
    init_venv(dirs)
    setup_pip(dirs)
    print("{:s}".format("=" * 40))
    print("{service} has been initialized. Please edit your source code in {codedir}.".format(
        service=dirs['service_name'],
        codedir=dirs['codedir']
    ))
    print("{:s}".format("=" * 40))
