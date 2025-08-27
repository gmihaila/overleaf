FROM sharelatex/sharelatex:latest

# Install additional LaTeX packages
RUN tlmgr update --self && tlmgr install algorithm2e

# You can install multiple packages at once
# RUN tlmgr update --self Makefile&& tlmgr install algorithm2e algorithms algorithmicx