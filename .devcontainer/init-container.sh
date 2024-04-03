#!/usr/bin/env bash

function chown_volumes() {
  sudo chown -R vscode:golang "/go"
  sudo chown -R vscode:vscode "${HOME}/.fonts"
  sudo chown -R vscode:vscode "${HOME}/.cache"
}

function importP10kConf() {
  if [ ! -e "${HOME}/.fonts/MesloLGS_NF_Regular.ttf" ]; then
    curl -o "${HOME}/.fonts/MesloLGS_NF_Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  fi
  if [ ! -e "${HOME}/.fonts/MesloLGS_NF_Bold.ttf" ]; then
    curl -o "${HOME}/.fonts/MesloLGS_NF_Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  fi
  if [ ! -e "${HOME}/.fonts/MesloLGS_NF_Italic.ttf" ]; then
    curl -o "${HOME}/.fonts/MesloLGS_NF_Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  fi
  if [ ! -e "${HOME}/.fonts/MesloLGS_NF_BoldItalic.ttf" ]; then
    curl -o "${HOME}/.fonts/MesloLGS_NF_BoldItalic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
  fi

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  if [ -e "${HOME}/.p10k.zsh" ]; then
    if [ ! -s "${HOME}/.p10k.zsh" ]; then
      cp -f "${WORKSPACE}/.p10k.zsh.std" "${HOME}/.p10k.zsh"
    fi
  else
    cp -f "${WORKSPACE}/.p10k.zsh.std" "${HOME}/.p10k.zsh"
  fi
}

function setup_zsh() {
  cp -f "${WORKSPACE}/.devcontainer/.zshrc" "${HOME}/.zshrc"
}

function install_pre_commit() {
  pipx install pre-commit
}

function main() {
  chown_volumes
  importP10kConf
  setup_zsh
  install_pre_commit
}

main
