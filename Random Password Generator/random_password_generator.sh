#!/bin/bash

# Function to generate a random password
generate_password() {
    local length=$1
    local include_uppercase=$2
    local include_lowercase=$3
    local include_numbers=$4
    local include_special=$5

    # Define character sets
    local chars=""
    if [ "$include_uppercase" = "y" ]; then
        chars+="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    fi
    if [ "$include_lowercase" = "y" ]; then
        chars+="abcdefghijklmnopqrstuvwxyz"
    fi
    if [ "$include_numbers" = "y" ]; then
        chars+="0123456789"
    fi
    if [ "$include_special" = "y" ]; then
        chars+="!@#$%^&*()-_=+[]{};:,.<>?/~"
    fi

    # Check if no character set is selected
    if [ -z "$chars" ]; then
        echo "Error: No character set selected."
        exit 1
    fi

    # Generate the password
    local password=""
    for i in $(seq 1 "$length"); do
        password+="${chars:RANDOM%${#chars}:1}"
    done

    echo "$password"
}

# Prompt the user for password criteria
read -p "Enter the length of the password: " length
read -p "Include uppercase letters? (y/n): " include_uppercase
include_uppercase=$(echo "$include_uppercase" | tr '[:upper:]' '[:lower:]')

read -p "Include lowercase letters? (y/n): " include_lowercase
include_lowercase=$(echo "$include_lowercase" | tr '[:upper:]' '[:lower:]')

read -p "Include numbers? (y/n): " include_numbers
include_numbers=$(echo "$include_numbers" | tr '[:upper:]' '[:lower:]')

read -p "Include special characters? (y/n): " include_special
include_special=$(echo "$include_special" | tr '[:upper:]' '[:lower:]')

# Generate the password
password=$(generate_password "$length" "$include_uppercase" "$include_lowercase" "$include_numbers" "$include_special")

echo "Generated Password: $password"
