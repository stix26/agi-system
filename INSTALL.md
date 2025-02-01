# AGI System Installation Script

# Step 1: Clone the Repository
git clone https://github.com/stix26/agi-system.git
cd agi-system

# Step 2: Install Dependencies
sudo apt update
sudo apt install nasm python3 python3-pip

# Step 3: Build the System
bash tools/build.sh

# Step 4: Run the System
bash tools/run.sh

# Step 5: Test the System
bash tools/test.sh