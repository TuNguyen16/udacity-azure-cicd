# Using Ubuntu 22.04
FROM ubuntu:22.04
# Setup shell to bash
SHELL ["/bin/bash", "-c"] 
# Update package list
RUN apt-get update
# Install necessary packages
RUN apt-get install wget git make zip software-properties-common -y
# Add python repository to install python build environment
RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update
# Install python build environment
RUN apt-get install python3.10 python3.10-venv python3.10-dev -y
# Install pip
RUN wget -qO- https://bootstrap.pypa.io/get-pip.py | python3.10
# Create user agent
RUN useradd agent
# Switch to user agent
USER agent
# Set working directory to user agent home
WORKDIR /home/agent
# Create folder to extract agent
RUN mkdir myagent && cd myagent
# Set working directory to newly created folder
WORKDIR /home/agent/myagent
# Download agent package from Microsoft
RUN wget -O agent.tar.gz https://vstsagentpackage.azureedge.net/agent/3.245.0/vsts-agent-linux-x64-3.245.0.tar.gz
# Extract agent package (remove it after done)
RUN tar zxvf agent.tar.gz && rm -rf agent.tar.gz
# Switch to ROOT user to install dependencies for agent
USER root
# Install dependencies for agent
RUN ./bin/installdependencies.sh
# Switch back to user agent to run agent
USER agent
# Configure agent with these parameter:
# --url: your Azure Devops organization (ex: https://dev.azure.com/<your-organization-name>)
# --token: your personal access token
# --pool: your custom agent pool
# --agent: name of the agent
RUN ./config.sh --unattended --url <azure-devops-organization-link-here> --auth pat --token <personal-access-token-here> --pool <agent-pool-name-here> --agent <agent-name-here>
# Default command to run the agent
CMD ["./run.sh"]