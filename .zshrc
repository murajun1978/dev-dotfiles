eval "$(starship init zsh)"
eval "$(mise activate zsh)"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Set default editor
export EDITOR=nvim

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load secrets functions
source ~/.zsh/secrets.zsh

# Set environmental variables
## Nanobanana API KEY
export NANOBANANA_GEMINI_API_KEY=$(secret NANOBANANA_GEMINI_API_KEY)
