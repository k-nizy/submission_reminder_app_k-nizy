#!/bin/bash

# Ask the user for their name
echo "Please enter your name:"
read yourName

# Create the main directory
main_dir="submission_reminder_${yourName}"
mkdir -p "$master_dir"

# Create subdirectories
mkdir -p "$master_dir/config"
mkdir -p "$master_dir/modules"
mkdir -p "$master_dir/assets"

# Create and populate the config.env file
cat <<EOL > "$master_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create and populate the reminder.sh file
cat <<EOL > "$master_dir/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOL

# Make reminder.sh executable
chmod +x "$master_dir/reminder.sh"

# Create and populate the functions.sh file
cat <<EOL > "$master_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOL

# Make functions.sh executable
chmod +x "$master_dir/modules/functions.sh"

# Create and populate the submissions.txt file with 10 additional students
cat <<EOL > "$master_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
John, Shell Navigation, not submitted
Jane, Git, submitted
Alice, Shell Navigation, not submitted
Emma, Shell Navigation, not submitted
Noah, Shell Navigation, not submitted
Olivia, Shell Basics, submitted
William, Shell Navigation, not submitted
Ava, Git, submitted
James, Shell Navigation, not submitted
Isabella, Shell Basics, submitted
Sophia, Git, submitted
Mason, Shell Navigation, not submitted
EOL

# Create the startup.sh script
cat <<EOL > "$master_dir/startup.sh"
#!/bin/bash

# Start the reminder application
./reminder.sh
EOL

# Make the startup.sh script executable
chmod +x "$master_dir/startup.sh"

echo "Environment setup complete. You can now run the application by executing the startup.sh script in the $main_dir directory."
