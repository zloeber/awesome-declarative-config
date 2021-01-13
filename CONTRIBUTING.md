# Contribution Guidelines

Please note that this project is released with a [Contributor Code of Conduct](CODE-OF-CONDUCT.md). By participating in this project you agree to abide by its terms.

---

The process for contributing to this repo is as follows:

- Fork this repo
- Clone this repo to your local workstation
- Create a new branch
- Update `list.yml` to include your submission entry
- Optionally run `make deps test` to validate your entry
- Push your new branch with the updated list entry to Github
- Submit your PR for approval

## Development 

In addition to the PR process above you can also setup this repo's local development environment. This assumes you have Python3, make, and are using a Linux/Mac/WSL environment.

- Setup the local virtual environment by running `make deps`
- Build and preview the generated website with `make serve` (http://localhost:8000 by default)

You can view additional tasks by running `make` without any arguments.

## Updating your PR

If the maintainers notice anything that we'd like changed, we'll ask you to edit your PR before we merge it. There's no need to open a new PR, just edit the existing one. If you're not sure how to do that, [here is a guide](https://github.com/RichardLitt/knowledge/blob/master/github/amending-a-commit-guide.md) on the different ways you can update your PR so that we can merge it.
