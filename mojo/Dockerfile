FROM ubuntu:22.04

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y apt-transport-https curl gnupg libedit2 python3-venv

ARG MOJOAUTH

RUN curl https://get.modular.com | bash - \
	&& modular auth $MOJOAUTH

RUN modular auth $MOJOAUTH && modular install mojo

RUN BASHRC=$( [ -f "$HOME/.bash_profile" ] && echo "$HOME/.bash_profile" || echo "$HOME/.bashrc" ) \
	&& echo 'export MODULAR_HOME="/root/.modular"' >> "$BASHRC" \
	&& echo 'export PATH="/root/.modular/pkg/packages.modular.com_mojo/bin:$PATH"' >> "$BASHRC"
