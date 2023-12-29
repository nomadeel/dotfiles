# PATH Environment

# Local bin directory
PATH="$PATH:$HOME/bin"
# Ruby bin directory
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
# Rust bin directory
PATH="$PATH:$HOME/.cargo/bin"
# Another local bin directory
PATH="$PATH:$HOME/.local/bin"
# Add machine queue directory
PATH="$PATH:$HOME/documents/work/machine_queue"
# Add Elixir mix tools
PATH="$PATH:$HOME/.mix/escripts/"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export EDITOR="nvim"
export VISUAL="nvim"

# QT based hacks to get it use the same theme and render elements properly
export QT_QPA_PLATFORMTHEME=gtk3
export QT_AUTO_SCREEN_SCALE_FACTOR=0

export RUST_SRC_PATH="$HOME/rust/src/"

export SUDO_ASKPASS="/usr/lib/ssh/ssh-askpass"

# CMake
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

