.PHONY: ensure-brew pack unpack pack-zshr unpack-zshrc pack-nvim unpack-nvim pack-brew unpack-brew

pack: ensure-brew pack-zshr pack-nvim pack-brew pack-ghostty
unpack: ensure-brew unpack-zshrc unpack-nvim unpack-brew unpack-ghostty

ensure-brew:
	@command -v brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

pack-zshrc:
	cp ~/.zshrc .
	cp ~/.oh-my-zsh/themes/custom.zsh-theme ohmyzsh/themes/

unpack-zshrc:
	cp ./.zshrc ~/.zshrc
	cp ./ohmyzsh/themes/custom.zsh-theme ~/.oh-my-zsh/themes/

pack-nvim:
	mkdir -p ./config/nvim
	cd ~/.config/nvim && find . -name "*.lua" | cpio -pdm $(CURDIR)/config/nvim/

unpack-nvim:
	mkdir -p ~/.config/nvim
	cp -r ./config/nvim/* ~/.config/nvim/

pack-brew:
	brew bundle dump --force --file=./Brewfile

unpack-brew:
	brew bundle install --file=./Brewfile

pack-ghostty:
	cp -r ~/.config/ghostty/* ./config/ghostty/

unpack-ghostty:
	cp -r ./config/ghostty/* ~/.config/ghostty/
