from setuptools import setup, find_packages

setup(
    name="vivi-env-init",
    version="1.0.0",
    packages=find_packages(),
    include_package_data=True,
    install_requires=["cerberus"],
    entry_points={
        "console_scripts": [
            "vivi-env-init = vivi_env_init.cli:main"
        ],
    },
)