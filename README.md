# AGI System Quick Start Guide

## Installation
1. Clone the repository
   ```bash
   git clone https://github.com/stix26/agi-system.git
   cd agi-system
   ```
2. Install dependencies
   ```bash
   sudo apt update
   sudo apt install nasm python3 python3-pip
   ```

## Building
You can build the project using the provided Makefile:
```bash
make
```
This produces the `agi_system` executable.

## Running
Run the system using the helper script:
```bash
./tools/run.sh
```

## Examples
Sample input and output files can be found in the `examples/` directory. To generate random input data:
```bash
python3 -c "import random; open('generated_input.txt','w').writelines(f'{random.randint(0,10)} {random.randint(0,10)}\n' for _ in range(10))"
```
Then execute the system with your custom input file:
```bash
./agi_system config/system_config.cfg examples/generated_input.txt
```
Logs are written to `logs/agi.log` if enabled in the configuration.

For more details see `USAGE.md`.

## Database Setup
The project includes a lightweight SQLite database used for storing log
messages during testing. Initialize the database with:
```bash
./tools/setup_db.sh
```
This creates an `agi.db` file in the repository root containing the `agi_logs`
table.

## Running Tests
Use the helper script to initialize the database and run the assembly tests:
```bash
./tools/test.sh
```
This compiles the test suite and runs the resulting `tests/run_tests` binary.
