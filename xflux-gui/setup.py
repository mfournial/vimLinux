#!/usr/bin/env python

from distutils.core import setup
import os

data_files = [
    ('share/icons/hicolor/scalable/apps', ['icons/hicolor/fluxgui.svg']),
    ('share/icons/ubuntu-mono-dark/scalable/apps', ['icons/ubuntu-mono-dark/fluxgui.svg']),
    ('share/icons/ubuntu-mono-light/scalable/apps', ['icons/ubuntu-mono-light/fluxgui.svg']),
    ('share/applications', ['desktop/fluxgui.desktop'])]

scripts = ['fluxgui']
if (os.path.exists("xflux")):
    scripts.append('xflux')
else:
    print("""WARNING: if you are running 'python setup.py' manually, and not as
part of Debian package creation, then you need to download the 'xflux'
binary separately. You can do this by running

    python ./download-xflux.py

before running 'setup.py'.""")

setup(name = "f.lux indicator applet",
    version = "1.1.10~pre",
    description = "f.lux indicator applet - better lighting for your computer",
    author = "Kilian Valkhof, Michael and Lorna Herf, Josh Winters",
    author_email = "kilian@kilianvalkhof.com",
    url = "http://www.stereopsis.com/flux/",
    license = "MIT license",
    package_dir = {'fluxgui' : 'src/fluxgui'},
    packages = ["fluxgui",],
    package_data = {"fluxgui" : ["*.glade"] },
    data_files=data_files,
    scripts = scripts,
    long_description = """f.lux indicator applet is an indicator applet to
    control xflux, an application that makes the color of your computer's
    display adapt to the time of day, warm at nights and like sunlight during
    the day""",
  )

