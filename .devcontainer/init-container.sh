#!/usr/bin/env bash

function importP10kConf() {
  sudo chown -R vscode:vscode "${HOME}/.fonts"
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

function main() {
  importP10kConf
  setup_zsh
}

main
