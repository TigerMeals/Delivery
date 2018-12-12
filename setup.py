from setuptools import setup

setup(
    name='tigermeals',
    packages=setuptools.find_packages(),
    include_package_data=True,
    install_requires=[
        'flask'
    ],
)
