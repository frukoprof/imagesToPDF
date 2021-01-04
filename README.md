# imagesToPDF
Takes a folder of images and turns it into a single PDF file.

Works under 64-bit only.
For 32-bit support take a look at documentations below.

Only processes JPG and PNG images.
Can easily be modified to support other formats via calling their functions. 

Executable and dlls for 64-bit is under bin-64 folder.

Documentation of libHaru library can be found at https://github.com/libharu/libharu

Thanks Thrawn for creating a wrapper, <br />
https://autohotkey.com/board/topic/40659-wrapper-for-libharu-creates-pdfs-stdlib-r1-2009-05-11/

and gwarble for adding Unicode support! <br />
https://www.autohotkey.com/boards/viewtopic.php?style=7&f=6&t=60192

Variable names are pretty self explanatory but simply <br />
creates a new PDF document <br />
loops over jpg and png images under the folder you selected <br />
add a new page which sizes are width and height of the image <br />
optionally rotates the page <br />
saves the pdf document.
