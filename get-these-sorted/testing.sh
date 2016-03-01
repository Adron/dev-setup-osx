
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash;

source ~/.bash_profile

nvm install 4.3.1;
nvm install stable;

nvm alias default stable;