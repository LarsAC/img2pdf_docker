FROM python:3.6.9-alpine

RUN apk --no-cache add build-base \
                       # Pillow dependencies
                       jpeg-dev \
                       zlib-dev \
                       freetype-dev \
                       lcms2-dev \
                       openjpeg-dev \
                       tiff-dev \
                       tk-dev \
                       tcl-dev \
                       harfbuzz-dev \
                       fribidi-dev

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY src/ /app
WORKDIR /app

ENTRYPOINT ["python3", "images2pdf.py" ]
CMD ["/input", "/output/images.pdf"]
