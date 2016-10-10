# Setup from HTML page #
The following script takes an input from a raw HTML page. It is structured like this:

cat example.html | ./setup.sh

The script itself may not be the most efficient. 
First, it creates a new batch script named "files.sh" with a shebang in it. Then, it searches through example.html for the pattern "File:". It creates a new directory. It removes all html tags and replaces the string "File:" with "touch " and redirects the output into another script and makes that script executable. It runs the script and makes all the newly created files executable. It adds a shebang to each empty file. Finally it cleans up the two batch scripts that it just created.
