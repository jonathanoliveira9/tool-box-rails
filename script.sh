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

echo "Type the path to install the project (e.g - /home/user/Documents/Projects)"

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

echo "Running Bundle"

eval "cd $path_project/$project_name && bundle"

eval "cd $path_project/$project_name && rails generate rspec:install"

echo ""
echo ""
echo ""
echo ""
echo "Installing Faker"
echo ""
echo ""
echo ""
echo ""

cat "$file_path/dependencies/faker/gem" >> "$path_project/$project_name/Gemfile"

echo "Running Bundle"

eval "cd $path_project/$project_name && bundle"

echo ""
echo ""
echo ""
echo ""
echo "Installing Factory Bot"
echo ""
echo ""
echo ""
echo ""

cat "$file_path/dependencies/factory_bot/gem" >> "$path_project/$project_name/Gemfile"

echo "Running Bundle"

eval "cd $path_project/$project_name && bundle"

eval "mkdir $path_project/$project_name/spec/factories"

eval "mkdir $path_project/$project_name/spec/support"

echo "Importing Files"

eval "cp $file_path/dependencies/factory_bot/factory_bot.rb $path_project/$project_name/spec/support"

echo "" >> "$path_project/$project_name/spec/rails_helper.rb"

cat "$file_path/dependencies/factory_bot/config" >> "$path_project/$project_name/spec/rails_helper.rb"

echo ""
echo ""
echo ""
echo ""
echo "Installing Database Cleaner"
echo ""
echo ""
echo ""
echo ""

cat "$file_path/dependencies/database_cleaner/gem" >> "$path_project/$project_name/Gemfile"

echo "Running Bundle"

eval "cd $path_project/$project_name && bundle"

echo "Importing Files"

eval "cp $file_path/dependencies/database_cleaner/database_cleaner.rb $path_project/$project_name/spec/support"

echo "" >> "$path_project/$project_name/spec/rails_helper.rb"

cat "$file_path/dependencies/database_cleaner/config" >> "$path_project/$project_name/spec/rails_helper.rb"

echo ""
echo ""
echo ""
echo ""
echo "Configuration Docker"
echo ""
echo ""
echo ""
echo ""

eval "cp $file_path/dependencies/docker/start-puma $path_project/$project_name/bin"

eval "touch $path_project/$project_name/Dockerfile"

echo "FROM ruby:$ruby_version" >> "$path_project/$project_name/Dockerfile"

echo "" >> "$path_project/$project_name/Dockerfile"

cat "$file_path/dependencies/docker/Dockerfile" >> "$path_project/$project_name/Dockerfile"

eval "touch $path_project/$project_name/docker-compose.yml"

cat "$file_path/dependencies/docker/docker-compose/app.txt" >> "$path_project/$project_name/docker-compose.yml"

if [ $mysql_db == "Y" ]; then
  cat "$file_path/dependencies/docker/docker-compose/mysql.txt" >> "$path_project/$project_name/docker-compose.yml"
else
  if [ $postgres_db == "Y" ]; then
      cat "$file_path/dependencies/docker/docker-compose/postgres.txt" >> "$path_project/$project_name/docker-compose.yml"
  else
    echo "Db not mappead"
  fi
fi

cat "$file_path/dependencies/docker/docker-compose/redis.txt" >> "$path_project/$project_name/docker-compose.yml"

cat "$file_path/dependencies/docker/docker-compose/sidekiq.txt" >> "$path_project/$project_name/docker-compose.yml"

echo "Configuration Figaro Environment"

cat "$file_path/dependencies/figaro/gem" >> "$path_project/$project_name/Gemfile"

eval "cd $path_project/$project_name && bundle"

eval "cp $file_path/dependencies/credentials/application.yml $path_project/$project_name/"

echo "Configuration Sidekiq"

cat "$file_path/dependencies/sidekiq/gem" >> "$path_project/$project_name/Gemfile"

echo "Configuration Redis"

cat "$file_path/dependencies/redis/gem" >> "$path_project/$project_name/Gemfile"

eval "cd $path_project/$project_name && bundle"

sed  -i '1i require "sidekiq/web"' "$path_project/$project_name/config/routes.rb"

line_number=3
import_file="${file_path}/dependencies/sidekiq/config"

sed -i "${line_number}r ${import_file}" "$path_project/$project_name/config/routes.rb"
