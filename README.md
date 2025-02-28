# Login-simulation-in-Bash

This project is a command-line login system written in Bash that enables users to authenticate using their email and password. Credentials are stored in a CSV file and verified upon login. The system also ensures that users cannot log in multiple times simultaneously, preventing duplicate sessions.

To enhance security and usability, the script validates email formats using a regular expression before checking credentials. If authentication fails, users receive clear prompts to retry or cancel. Once logged in, they must log out before attempting to log in again, ensuring proper session management.

With a straightforward authentication process, this system provides an interactive and user-friendly experience. It efficiently manages login attempts while maintaining simplicity, making it a practical solution for basic credential verification in a Bash environment.
