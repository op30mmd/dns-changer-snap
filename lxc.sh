# 1. Install LXD (if not already installed)
sudo apt update  # Or your distribution's package manager
sudo apt install -y lxd

# 2. Initialize LXD (follow the prompts)
sudo lxd init  # Answer the questions - defaults are usually fine

# 3. Create an LXD container
lxc launch ubuntu:22.04 snap-builder  # Use a supported Ubuntu version

# 4. Get a shell inside the container
lxc exec snap-builder -- bash

# 5. Inside the container, install snapcraft and build tools
apt update
apt install -y snapcraft build-essential git # Add other build dependencies

# 6. Clone your project and build the snap
git clone https://github.com/op30mmd/dns-changer-snap.git
cd dns-changer-snap
snapcraft

# 7.  Copy the snap out of the container (from your host machine)
lxc file pull snap-builder/dns-changer-snap/dns-changer.snap .

# 8. (Optional) Stop and delete the container when done
lxc stop snap-builder
lxc delete snap-builder
