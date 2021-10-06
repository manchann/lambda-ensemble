FROM amazon/aws-lambda-python:3.7

# optional : ensure that pip is up to data
RUN /var/lang/bin/python3.7 -m pip install --upgrade pip

# install git
RUN yum install git -y

# git clone
RUN git clone https://github.com/manchann/lambda-ensemble.git

# install packages
RUN pip install -r lambda-ensemble/requirements.txt

# move lambdafunc.py
RUN cp profet-docker/lambda_function.py /var/task/

CMD ["lambda_function.lambda_handler"]