# AGI System Quick Start Guide

# Step 1: Install the System
# Follow the installation instructions in INSTALL.md or use the commands below:
git clone https://github.com/stix26/agi-system.git
cd agi-system
sudo apt update
sudo apt install nasm python3 python3-pip
bash tools/build.sh

# Step 2: Run the System
# Execute the compiled binary with the default configuration and input files:
bash tools/run.sh

# Step 3: Explore Examples
# Navigate to the examples folder to view sample input and output files:
cd examples

# Step 4: Generate Input Data Using Python
# Use the provided Python script to generate random input data:
python3 -c "import random; f = open('generated_input.txt', 'w'); [f.write(f'{random.randint(0, 10)} {random.randint(0, 10)}\\n') for _ in range(10)]; f.close()"

# Step 5: Run the System with Custom Input
# Use the generated input file to run the system:
./agi_system config/system_config.cfg examples/generated_input.txt

# Step 6: Check Logs
# View logs for debugging or system output:
cat logs/agi.log

# For more details, refer to the README.md and USAGE.md files.