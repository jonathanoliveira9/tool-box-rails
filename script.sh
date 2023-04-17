#!/bin/bash

file_path=$PWD
echo "Installing asdf"

sudo apt-get update

sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

if [-z which 'asadf']
then
  git clone https://github.com/excid3/asdf.git ~/.asdf
  echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
  echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
  echo 'legacy_version_file = yes' >> ~/.asdfrc
  echo 'export EDITOR="code --wait"' >> ~/.bashrc
  exec $SHELL
else
  echo 'asdf alread installed'
fi

asdf plugin add ruby

asdf plugin add nodejs

echo "Do you want to list the versions avaliable? (Y/N)"

read list_versions

case $list_versions in
"Y") asdf list all ruby ;;
"N") echo ".." ;;
*) echo "Wrong answer";;
esac

echo "Which version of Ruby do you want to install?"

read ruby_version

echo "Installing Ruby $ruby_version"

asdf install ruby $ruby_version

asdf global ruby $ruby_version

echo "Ruby $ruby_version has been installed."

echo ""
echo ""
echo ""
echo ""
echo ""
echo "███████╗███████╗████████╗██╗   ██╗██████╗     ██████╗  █████╗ ██╗██╗     ███████╗"
echo "██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    ██╔══██╗██╔══██╗██║██║     ██╔════╝"
echo "███████╗█████╗     ██║   ██║   ██║██████╔╝    ██████╔╝███████║██║██║     ███████╗"
echo "╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     ██╔══██╗██╔══██║██║██║     ╚════██║"
echo "███████║███████╗   ██║   ╚██████╔╝██║         ██║  ██║██║  ██║██║███████╗███████║"
echo "╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝         ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝"
echo ""
echo ""
echo ""
echo ""
echo ""

echo "Do you want to create the project? (Y/N)"

read create_project

case $create_project in
"Y") echo "" ;;
*) echo "Finished";;
esac

echo "Give a name to project (eg. octopus)"

read project_name

type_db=""
echo "Do you want to use MySQL database?(Y/N)"
read mysql_db

if [ $mysql_db == "Y" ]; then
  echo "MysQL selected"
  type_db="mysql"
else
  echo "Do you want to use PostgreSQL database(Y/N)?"
  read postgres_db
  if [ $postgres_db == "Y" ]; then
      echo "PostgreSQL selected"
      type_db="postgresql"
  else
    echo "Db not mappead"
    # raise a error - not implemented
  fi
fi

echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "                                           _                                 _                   "
echo "                                       _  (_)                               (_)              _   "
echo "  ____ _____ ____  _____  ____ _____ _| |_ _ ____   ____    ____   ____ ___  _ _____  ____ _| |_ "
echo " / _  | ___ |  _ \| ___ |/ ___(____ (_   _| |  _ \ / _  |  |  _ \ / ___/ _ \| | ___ |/ ___(_   _)"
echo "( (_| | ____| | | | ____| |   / ___ | | |_| | | | ( (_| |  | |_| | |  | |_| | | ____( (___  | |_ "
echo " \___ |_____|_| |_|_____|_|   \_____|  \__|_|_| |_|\___ |  |  __/|_|   \____| |_____)\____)  \__)"
echo "(_____|                                           (_____|  |_|            (__/                   "
echo ""
echo ""
echo ""
echo ""
echo ""

echo "Type the path to install the project"

read path_project
# Before verify if the database is installed if not raise an error

setup_project="cd $path_project/ && rails new $project_name --database=$type_db"
# Generating project
eval $setup_project

echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "░▀█▀░█▀█░█▀▀░▀█▀░█▀█░█░░░█░░░▀█▀░█▀█░█▀▀░░░█▀▄░█▀▀░█▀█░█▀▀░█▀█░█▀▄░█▀▀░█▀█░█▀▀░▀█▀░█▀▀░█▀▀"
echo "░░█░░█░█░▀▀█░░█░░█▀█░█░░░█░░░░█░░█░█░█░█░░░█░█░█▀▀░█▀▀░█▀▀░█░█░█░█░█▀▀░█░█░█░░░░█░░█▀▀░▀▀█"
echo "░▀▀▀░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░▀▀░░▀▀▀░▀░░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀"
echo ""
echo ""
echo ""
echo ""

echo "Installing RSPEC"
echo ""
echo ""
echo ""
echo ""

cat "$file_path/dependencies/rspec/gem" >> "$path_project/$project_name/Gemfile"
cat "$file_path/dependencies/rspec/gem"

echo "Running Bundle"

eval "cd $path_project/$project_name && bundle"

eval "cd $path_project/$project_name && rails generate rspec:install"