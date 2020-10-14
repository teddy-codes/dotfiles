pack:
	mkdir -p ./config/nvim
	cp ~/.config/nvim/init.vim ./config/nvim/
	cp ~/.zshrc .

unpack:
	mkdir -p ~/.config/nvim
	cp ./config/nvim ~/.config/nvim/
	cp ./.zshrc ~/.zshrc
