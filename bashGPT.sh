#!/bin/bash

# Check if the OPENAI_API_KEY is set
if [[ -z "${OPENAI_API_KEY}" ]]; then
  echo "Error: OPENAI_API_KEY is not set. Please set it and try again."
  exit 1
fi

# Read the plain English command from the user
if [ -z "$1" ]; then
  echo "Please enter a command in plain English:"
  read -r plain_command
else
  plain_command="$*"
fi

# Define the prompt for the OpenAI API
prompt="Convert the following plain English description to a bash command. If it cannot be converted to a valid bash command, return null: \"$plain_command\""

# Properly format the JSON payload
json_payload=$(jq -n --arg prompt "$prompt" '{
  model: "gpt-3.5-turbo",
  messages: [{"role": "user", "content": $prompt}],
  max_tokens: 60,
  temperature: 0.5
}')

# Call the OpenAI API
response=$(curl -s https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "$json_payload")

# Print the full response for debugging
# echo "API Response: $response"

# Extract the command from the API response using jq
bash_command=$(echo "$response" | jq -r '.choices[0].message.content' | sed 's/^ *//;s/ *$//')

# Check if the bash_command is null or empty
if [ -z "$bash_command" ] || [ "$bash_command" == "null" ]; then
  echo "Error: No valid bash command was generated."
  exit 1
fi

# Confirm the command with the user before executing
echo "Bash command generated: $bash_command"
read -p "Do you want to execute this command? [y/N]: " confirmation

if [[ "$confirmation" =~ ^[Yy]$ ]]; then
  eval "$bash_command"
else
  echo "Command execution aborted."
fi
