#!/usr/bin/env python3
"""
Finds all git repos under the specified root and runs "git fetch"
"""
# TODO(rkm 2020-06-16) Add a max depth option.
# TODO(rkm 2020-06-16) async-ify
import logging
import subprocess
from argparse import ArgumentParser
from pathlib import Path


def main() -> int:

    logging.basicConfig(format="%(levelname)-8s %(message)s",)

    parser = ArgumentParser()
    parser.add_argument("root", help="The root directory to find repos under")
    args = parser.parse_args()
    root = Path(args.root)
    assert root.is_dir()

    git_dirs = subprocess.run(
        f"find {root} -type d -name .git",
        shell=True,
        check=True,
        stdout=subprocess.PIPE,
    )
    repos = [Path(x).parent for x in git_dirs.stdout.decode().split()]
    if not repos:
        logging.warning(f"no repos found under '{root}'")
        return 0

    for repo in repos:
        try:
            subprocess.run(
                f"git -C {repo} fetch --all --prune",
                shell=True,
                check=True,
                stderr=subprocess.PIPE,
            )
        except subprocess.CalledProcessError as exc:
            logging.exception(
                "failed to fetch - repo/fork may have been deleted "
                f"({exc.stderr.decode()[:-1]})"
            )
            return 1

    return 0


if __name__ == "__main__":
    exit(main())
