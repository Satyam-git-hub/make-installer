.PHONY: docker

docker:
    @if ! command -v docker &> /dev/null; then \
        echo "Docker is not installed. Installing Docker..."; \
        ./install_docker.sh; \
    elif ! getent group docker | grep &>/dev/null "\b$(USER)\b"; then \
        echo "Current user is not part of the docker group. Adding user to the docker group..."; \
        sudo usermod -aG docker $(USER); \
    else \
        echo "Docker is already installed and current user is part of the docker group."; \
    fi
