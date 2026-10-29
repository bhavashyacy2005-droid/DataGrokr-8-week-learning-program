# Week 7 – Full Gitflow Simulation

## Overview

This project is about understanding how Git and GitHub are used to manage code changes during software development. I created a simple Python application and used it to simulate a complete Gitflow workflow, including feature development, pull requests, merging, releases, and hotfixes.

The main idea was to understand how developers can work on new features without directly modifying the stable version of an application. I also explored how automated checks help identify issues before changes are merged.

## Objectives

- Understand Git branching and version control.
- Create and manage feature branches.
- Use pull requests to review and merge changes.
- Simulate release and hotfix workflows.
- Configure pre-commit hooks to check files before committing.
- Automate testing using GitHub Actions.
- Understand how CI helps maintain code quality.

## Tools and Technologies

- **Git** – Version control and branch management.
- **GitHub** – Repository hosting, pull requests, and releases.
- **Python** – Used to build a simple application.
- **Pytest** – Used to test the application.
- **Pre-commit** – Used to run checks before commits.
- **GitHub Actions** – Used to automate testing through a CI workflow.
- **YAML** – Used to configure pre-commit and GitHub Actions.

## Gitflow Workflow

I followed a Gitflow-style branching approach to understand how changes move from development to a stable release.

### 1. Main and Develop Branches

The `main` branch represents the stable version of the application, while the `develop` branch is used to integrate ongoing development work.

### 2. Feature Branch

I created a separate feature branch to add a tax calculation function to the Python application. This allowed me to work on the feature independently before integrating it into the development branch.

### 3. Pull Request and Merge

After completing the feature, I used a pull request to propose the changes for merging into `develop`. This helped me understand the importance of reviewing code and checking whether tests pass before merging.

### 4. Release Branch

I used a release branch to simulate preparing version `1.0.0` of the application. The release workflow demonstrates how changes can be finalized before being merged into `main` and tagged with a version number.

### 5. Hotfix Branch

I simulated an urgent fix for a released version by creating a hotfix branch. The fix was prepared for merging into `main`, and the workflow also includes merging the correction back into `develop` to keep both branches consistent.

## Pre-commit Hooks

I configured pre-commit hooks to run basic checks before a Git commit is created.

The configured checks include:

- Removing trailing whitespace.
- Ensuring files end with a newline.
- Checking YAML file formatting and validity.

These checks help maintain consistent files and catch simple issues early in the development process.

## GitHub Actions CI

I configured a GitHub Actions workflow to automatically run the Python tests when changes are pushed to `main` or `develop`, or when a pull request targets either branch.

The workflow checks out the repository, sets up Python, installs the required dependencies, and runs the test suite using pytest.

This demonstrates how continuous integration can help detect problems before changes are integrated into a branch.

## Testing

The Python application includes tests for:

- Calculating the total price.
- Applying a discount.
- Rejecting negative prices.
- Rejecting invalid discount values.
- Calculating the total after tax is applied.

These tests help verify the application's basic functionality and demonstrate how automated testing can be incorporated into a Git workflow.

## What I Learned

Through this project, I gained practical experience with Git branching, pull requests, merging, release tags, and hotfixes. I also learned how to configure pre-commit hooks and use GitHub Actions to automate tests.

Overall, this project helped me understand how version control, code quality checks, and continuous integration work together in a software development workflow.

## Conclusion

This project provided hands-on practice with a Gitflow-style development process using a simple Python application. It helped me understand how developers manage features, prepare releases, handle urgent fixes, and use automation to maintain code quality throughout the development lifecycle.
