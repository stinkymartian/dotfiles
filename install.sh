project_directory="$(pwd)"

assert_file_does_not_exist()
{
	if [ -e "$1" ]; then
		echo "File '$1' already exists." 1>&2
		exit 1
	fi
}

if [ $# -eq 0 ]; then
	echo "Usage: $0 <argument>"
	echo
	echo 'Arguments:'
	echo '  bash: Install bash-related configuration files.'
	echo '  vim: Install vim-related configuration files.'
	echo '  git: Install git-related configuration files.'
	echo '  i3: Install i3-related configuration files.'
	echo '  kitty: Install kitty-related configuration files.'
elif [ "$1" = bash ]; then
	assert_file_does_not_exist "$HOME/.bashrc"
	ln -s "$project_directory/bashconfig" "$HOME/.bashrc"
elif [ "$1" = vim ]; then
	assert_file_does_not_exist "$HOME/.vimrc"
	ln -s "$project_directory/vimconfig" "$HOME/.vimrc"
elif [ "$1" = git ]; then
	assert_file_does_not_exist "$HOME/.gitconfig"
	ln -s "$project_directory/gitconfig" "$HOME/.gitconfig"
elif [ "$1" = i3 ]; then
	assert_file_does_not_exist "$HOME/.config/i3/config"
	mkdir -p "$HOME/.config/i3"
	ln -s "$project_directory/i3config" "$HOME/.config/i3/config"
elif [ "$1" = kitty ]; then
	assert_file_does_not_exist "$HOME/.config/kitty/kitty.conf"
	mkdir -p "$HOME/.config/kitty"
	ln -s "$project_directory/kittyconfig" "$HOME/.config/kitty/kitty.conf"
else
	echo "Argument '$1' is invalid." 1>&2
	exit 1
fi
