# Repository Setup Script

## Overview

This repository contains a Bash script designed to automate the setup of a new Git repository for YouCode projects. The script performs the following tasks:

1. **Creates a Directory**: Prompts for a directory name and creates it if it doesn't exist.
2. **Sets Up Git**: Initializes a Git repository within the new directory, adds files, and makes an initial commit.
4. **Creates GitHub Repositories**: Creates a new repository and sets up the remote.
5. **Create GitHub Repository in Organisation**: Creates a new repository in the organisation and sets up the remote (--push).
6. **Pushes Changes**: Pushes the initial commit to the GitHub repositories.

## Prerequisites

- **Git**: Ensure Git is installed on your system.
- **GitHub CLI**: This script requires GitHub CLI (`gh`). Install it from [GitHub CLI](https://cli.github.com/).
- **Git Bash**: For running the script on Windows, you should have Git Bash installed. Download it from [Git for Windows](https://gitforwindows.org/).

## Installation

1. **Clone this Repository**:
   ```bash
   git clone https://github.com/Yorften/setup-repo-script.git
