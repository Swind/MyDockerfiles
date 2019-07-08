#!/bin/bash
if [ ! -d "$HOME/.pyenv" ]; then
  echo "===== Installing pyenv ====="
  curl https://pyenv.run | bash
fi

BASH_PROFILE="$HOME/.bashrc"

if [[ ! $(cat $BASH_PROFILE | grep "pyenv init") ]]; then
  echo "Set the $BASH_PROFILE for pyenv"
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $BASH_PROFILE
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $BASH_PROFILE
  echo 'eval "$(pyenv init -)"' >> $BASH_PROFILE
  echo 'eval "$(pyenv virtualenv-init -)"' >> $BASH_PROFILE
fi

echo "Initialize pyenv environment..."
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

PYENV_VIRTUALENV_NAME="stress-test"
TARGET_PYTHON_VERSION="3.7.3"

if [[ $(pyenv versions | grep "* ${PYENV_VIRTUALENV_NAME}") ]]; then
  echo "pyenv and virtualenv ${PYENV_VIRTUALENV_NAME} is existing"
else
  if [[ $(pyenv versions | grep "${TARGET_PYTHON_VERSION}") ]]; then
    echo "python ${TARGET_PYTHON_VERSION} is installed."
  else
    echo "Install python $TARGET_PYTHON_VERSION"
    pyenv install $TARGET_PYTHON_VERSION
  fi

  echo "Creating pyenv virtualenv $PYENV_VIRTUALENV_NAME - $TARGET_PYTHON_VERSION"
  pyenv update
  pyenv virtualenv $TARGET_PYTHON_VERSION $PYENV_VIRTUALENV_NAME
  pyenv global $PYENV_VIRTUALENV_NAME
  pip install -U pip
  pip install opencv-python==3.4.4.19
  pip install opencv-contrib-python==3.4.4.19
  pip install invoke
fi
