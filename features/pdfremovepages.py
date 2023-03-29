# Remove Pages from PDF

import PyPDF2

# Open the PDF file in read-binary mode
with open('in.pdf', 'rb') as file:
    # Create a PDF reader object
    pdf_reader = PyPDF2.PdfReader(file)

    # Create a PDF writer object
    pdf_writer = PyPDF2.PdfWriter()

    # Loop over the pages and add them to the writer object,
    # starting from the third page (index 2)
    for page_num in range(2, len(pdf_reader.pages)):
         pdf_writer.add_page(pdf_reader.pages[page_num])

    # Write the output to a new PDF file
    with open('out.pdf', 'wb') as output:
        pdf_writer.write(output)