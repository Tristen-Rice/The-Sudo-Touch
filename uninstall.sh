#!/bin/bash

: '
MIT License

Copyright (c) 2024 Tristen J. Rice

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

Coded on 02/29/2024 by Tristen J. Rice.
'

# Check if script is running on macOS
if [[ "$(uname)" != "Darwin" ]]; then 
    echo "This script can only be run on macOS"
    exit 1
fi

# Check if logged in user has sudo privileges
if sudo -n true 2>/dev/null; then 
    echo "This script requires sudo privileges"
    exit 1
fi

# Target file
FILE="/etc/pam.d/sudo"
COPY="/etc/pam.d/sudo.bak"

# Make a backup copy
sudo cp $FILE $COPY

# Remove the line if it exists
if sudo grep -q "auth       sufficient     pam_tid.so" $FILE ; then
    sudo sed -i.bak '/auth       sufficient     pam_tid.so/d' $FILE
    echo "The line has been removed."
else
    echo "The line does not exist."
fi

# Show diff
echo "Showing diff between the original and the new file:"
diff $COPY $FILE

# Ask user if it's ok to continue
read -p "The line 'auth       sufficient     pam_tid.so' has been removed. Are you sure you want to save these changes? If not, the remove operation will be cancelled. (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    # Replace new file with the original file
    sudo mv $COPY $FILE
    echo "Operation cancelled."
else
    echo "Changes saved."
fi

# Clean up backup files
sudo rm $FILE.bak $COPY