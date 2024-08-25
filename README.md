# bashGPT

`bashGPT` is a command-line tool that converts plain English descriptions into valid bash commands using OpenAI's GPT-3.5-turbo model. It ensures that only syntactically valid bash commands are generated, offering a convenient way to perform common system operations through natural language.

## Features

- **Convert English to Bash:** Translate natural language descriptions into valid bash commands.
- **Syntax Validation:** Automatically checks that the generated commands are valid bash syntax.
- **User Confirmation:** Prompts the user to confirm before executing the generated command.
- **Error Handling:** Exits gracefully if the input cannot be converted to a valid bash command.

## Installation

### Prerequisites

- **Bash:** This tool is written in bash and requires a Unix-like environment (Linux, macOS, WSL on Windows).
- **OpenAI API Key:** You need an API key from OpenAI to use this tool.

### Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/madhunimmo/bashGPT.git
   cd bashGPT
   ```

2. **Set Up the API Key:**

   You can set the OpenAI API key as an environment variable:

   ```bash
   export OPENAI_API_KEY="your-openai-api-key"
   ```

   Alternatively, you can add this line to your `.bashrc` or `.zshrc` to make it persistent:

   ```bash
   echo 'export OPENAI_API_KEY="your-openai-api-key"' >> ~/.bashrc
   source ~/.bashrc
   ```

3. **Make the Script Executable:**

   ```bash
   chmod +x bashGPT.sh
   ```

## Usage

You can use `bashGPT` by either passing the plain English description as an argument or entering it interactively.

### Example 1: Passing as an Argument

```bash
./bashGPT.sh "list all files in the current directory"
```

### Example 2: Interactive Input

```bash
./bashGPT.sh
Please enter a command in plain English:
> list all files in the current directory
```

### Example Output

```
Bash command generated: ls
Do you want to execute this command? [y/N]: y
```

If the command is valid and the user confirms, the tool will execute the command.

### Handling Invalid Commands

If the input cannot be converted into a valid bash command, `bashGPT` will return an error and exit:

```
Error: No valid bash command was generated.
```

## Contributing

If you'd like to contribute to this project, feel free to fork the repository and submit a pull request. Any suggestions, bug reports, or improvements are welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgements

This tool leverages OpenAI's GPT-3.5-turbo model for natural language processing and the `jq` tool for JSON manipulation. Special thanks to OpenAI for providing the API and the community for developing open-source tools like `jq`.