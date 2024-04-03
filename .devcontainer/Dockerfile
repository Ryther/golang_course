FROM mcr.microsoft.com/devcontainers/go:1-1.22-bookworm

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Fix vscode user ownership and permissions
RUN    true \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R "${USERNAME}" /commandhistory \
    && mkdir -p "/home/${USERNAME}/.vscode-server/extensions" \
    && mkdir -p "/home/${USERNAME}/.cache" \
    && mkdir -p "/home/${USERNAME}/.fonts" \
    && chown -R "${USERNAME}":"${USERNAME}" "/home/${USERNAME}" \
    && true

USER ${USERNAME}
