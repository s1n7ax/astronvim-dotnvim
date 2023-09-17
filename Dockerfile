FROM ubuntu:latest

ENV USER=s1n7ax
ENV UID=1000
ENV GID=1000
ENV PATH="${PATH}:/home/s1n7ax/.cargo/bin:/home/s1n7ax/.local/share/bob"

# Update
RUN apt-get update

# Runtime dependencies
RUN \
	apt-get -y install \
	curl \
	git \
	python3 \
	python3-pip \
	python-is-python3 \
	ripgrep \
	sudo

# Build dependencies
RUN \
	apt-get -y install \
	pkg-config \
	libssl-dev \
	build-essential


RUN groupadd \
	--gid $GID \
	$USER

RUN useradd \
	--uid $UID \
	--gid $GID \
	--create-home \
	$USER

RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}
WORKDIR /home/$USER

# Rust Installation
RUN curl \
	--proto '=https' \
	--tlsv1.2 \
	-sSf https://sh.rustup.rs | sh -s -- -y

# Cargo install
RUN cargo install \
	--locked \
	bob-nvim \
	cargo-leptos

# Neovim installation
RUN bob install nightly
RUN bob use nightly

ENV PATH = "$PATH:/home/s1n7ax/.local/share/bob/nvim-bin"

RUN git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
COPY . .config/astronvim

RUN nvim --headless "+Lazy! sync" +qa
