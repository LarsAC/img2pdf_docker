FROM python:3.6.9-alpine

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY src/ /app
WORKDIR /app

ENTRYPOINT ["python3", "images2pdf.py" ]
CMD ["/input", "/output/images.pdf"]
