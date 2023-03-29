# Compress PDF document

import PyPDF2

with open('in.pdf', 'rb') as infile:
    # Create a PDF reader object
    reader = PyPDF2.PdfReader(infile)

    # Create a PDF writer object
    writer = PyPDF2.PdfWriter()

    for page in reader.pages:
        page.compress_content_streams()  # This is CPU intensive!
        writer.add_page(page)

    # Open the output PDF file in write-binary mode
    with open('out.pdf', 'wb') as outfile:
        # Write the compressed PDF file to disk
        writer.write(outfile)