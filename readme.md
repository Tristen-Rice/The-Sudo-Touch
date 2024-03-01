# Touch ID for `sudo`
## Enhance Your Security, Not Compromise It!

Tired of the old-fashioned way of typing Passwords every time you use `sudo`? We get you. Maintaining security shouldn't be an annoying chore (even if it DOES keep your system safe!). Now, don't compromise, enhance your security with the power of biometrics on your Macbook: With this simple script, enable Touch ID authentication for `sudo`!

## What does it do?
This script modifies your sudo pam module, adding a single line of code that enables Touch ID authentication. 

It does have safety measures built-in:
- Checks that it's being run on macOS (Sorry Linux/Windows people!)
- Checks that you have `sudo` privileges on your machine
- Won't add redundant lines
- Checks before changes are applied.


## Usage

### Prerequisites 
You will need a MacBook with Touch ID functionality and the device must be running macOS.

### Instructions:

1. Download the repository files: `git clone https://github.com/Tristen-Rice/The-Sudo-Touch.git`
2. Enter the directory: `cd The-Sudo-Touch`
3. Give the script executable permissions by running `chmod +x touch-my-sudo.sh` in your terminal.
4. Run the script with `./touch-my-sudo.sh`.

That's it! Enjoy password-less sudo commands with the power of Touch ID!

(Note: This does not in any way decrease your security. If Touch ID fails, or isn’t available, it falls back to the password automatically.)

## Contribution
Please feel free to raise any issues or PRs if you want to suggest improvements or report issues.

## Disclaimer
Always ensure to back up important data before executing scripts that modify root files. Not responsible for loss of data, damage to your system or anything else that goes wrong. Please use responsibly!
