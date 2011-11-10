# Source RVM so vimius .rvmrc takes effect
if ! type rvm &> /dev/null; then
  [[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm
  [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
fi

# Add <strong>.old</strong> to any existing Vim file in the home directory
for i in ~/.vim ~/.vimrc ~/.gvimrc; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    echo "${i} has been renamed to ${i}.old"
    mv $i $i.old;
  fi
done

# Clone Vimius into .vim
git clone git://github.com/TechnoGate/vimius.git ~/.vim

# Run rake inside ~/.vim
( cd ~/.vim && rake )
