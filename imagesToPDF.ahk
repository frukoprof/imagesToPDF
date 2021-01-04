#NoEnv
#Include hpdf.ahk

SetWorkingDir, %A_ScriptDir%

hDll := HPDF_LoadDLL("libhpdf.dll")

FileSelectFolder, folder
createPDFfromFolder(folder)

HPDF_UnloadDLL(hDll)

MsgBox Done!

Return

createPDFfromFolder(folderName)
{
hDoc := HPDF_New("error","000")

Loop Files, %folderName%\*.*
	if (A_LoopFileExt = "jpg")
		newPageWithImage(hDoc, A_LoopFileFullPath, "jpg") 
	else if (A_LoopFileExt = "png")
		newPageWithImage(hDoc, A_LoopFileFullPath, "png")
	else
		continue

savePDF(hDoc)
}

newPageWithImage(hDoc, imageName, fileType)
{
page := HPDF_AddPage(hDoc)

if (fileType = "jpg")
	hImg := HPDF_LoadJpegImageFromFile(hDoc, imageName)
else if (fileType = "png")
	hImg := HPDF_LoadPngImageFromFile2(hDoc, imageName)

iw := HPDF_Image_GetWidth(hImg)
ih := HPDF_Image_GetHeight(hImg)

HPDF_Page_SetHeight(page, ih)
HPDF_Page_SetWidth(page, iw)

ph := HPDF_Page_GetHeight(page)
pw := HPDF_Page_GetWidth(page)

HPDF_Page_SetRotate(page, 90)
HPDF_Page_DrawImage(page, hImg, 0, 0, pw, ph)
}

savePDF(hDoc)
{
FileSelectFile, filePath, S, , , PDF (*.pdf)
HPDF_SaveToFile(hDoc, filePath . ".pdf")
}