#!/bin/bash

# Get the path to the _config.py file
config_path=$(python -c "import httpx; import os; print(os.path.join(os.path.dirname(httpx.__file__), '_config.py'))")

# Check if the file exists
if [ ! -f "$config_path" ]; then
    echo "Error: $config_path does not exist."
    exit 1
fi

# Create a backup of the original file
cp "$config_path" "${config_path}.bak"

# Modify the file
sed -i "s/DEFAULT_TIMEOUT_CONFIG = Timeout(timeout=5.0)/DEFAULT_TIMEOUT_CONFIG = Timeout(timeout=1000)/" "$config_path"

# Check if the modification was successful
if grep -q "DEFAULT_TIMEOUT_CONFIG = Timeout(timeout=60)" "$config_path"; then
    echo "Successfully modified $config_path"
    echo "A backup of the original file was created at ${config_path}.bak"
else
    echo "Failed to modify $config_path"
    echo "The original file remains unchanged"
fi