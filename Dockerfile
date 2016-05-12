FROM python:2.7

# Install diamond and environment template
RUN pip install git+git://github.com/Clever/Diamond.git@1011073426e68eabf75fa3f4962635586c06b4b5
RUN pip install docker-py
RUN pip install envtpl

# look at the host machine instead of the container
RUN find /usr/local/share/diamond/collectors/  -type f -name "*.py" -print0 | xargs -0 sed -i 's/\/proc/\/host_proc/g'


# Install Config files
RUN rm -rf /etc/diamond
ADD diamond /etc/diamond/

#startup script
ADD start.sh /
CMD /start.sh
