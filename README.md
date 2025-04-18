# Nvim configuration by JD
This repo contains my configuration on nvim.
This project started from the init.lua file in [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua) project. I recommend checking the [README.md](https://github.com/nvim-lua/kickstart.nvim) first.

## How to start

1. Install prerequisites (see below)
2. Clone the repo in `~/.config/nvim/`
    - Move the files from the repo directory to `.config/nvim/` 
3. Run `nvim`
    - Neovim checks first the `init.lua` file in `.config/nvim/`
    - This will automatically set the nvim config in the repo

### Install Neovim

This section tells all the steps I followed to download nvim & dependencies for this repo's config. I used WSL with Debian.
In my case I downloaded neovim from the github repo, built the source code and installed it as a Debian package. I also installed the [depencencies](https://github.com/nvim-lua/kickstart.nvim?tab=readme-ov-file#install-external-dependencies) from the kickstart.nvim project.

1. `sudo apt update`
2. Nvim prerequisites: `sudo apt install ninja-build gettext cmake curl build-essential`
3. kickstart.nvim prerequisites: `sudo apt install make gcc ripgrep unzip git xclip curl`
4. Get source code in `/opt/` directory:
    `cd /opt/
    git clone https://github.com/neovim/neovim`
5. Get the stable version: `cd /opt/neovim/ && git checkout stable`
6. Build the source code: `make CMAKE_BUILD_TYPE=RelWithDebInfo`
7. Create the Debian pkg: `cd build && cpack -G DEB`
    - I had to `sudo apt install file` because it was giving me error
8. Install the dpkg: `sudo dpkg -i nvim-linux-<arch>.deb` (with <arch> the architecture).
9. You can already run `nvim`.
