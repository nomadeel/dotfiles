# PATH Environment

# Local bin directory
PATH="$PATH:$HOME/bin"
# Ruby bin directory
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin:"
# Rust bin directory
PATH="$PATH:$HOME/.cargo/bin"
# Another local bin directory
PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH"
