downloadAndUnzip <- function(sourceUrl, targetDirectory, downloadFileName)
{
    targetFile      <- paste(targetDirectory, downloadFileName, sep="/") 
    
    timestampFile   <- paste(targetDirectory, "downloadTimestamp.txt", sep="/")
    
    if (!file.exists(targetFile))
    {
        if (!file.exists(targetDirectory))
        {
            dir.create(targetDirectory, recursive=TRUE)
        }
        
        download.file(sourceUrl, dest=targetFile, method="curl")
        
        write(format(Sys.time(), "%c"), timestampFile)    
        
        unzip(targetFile, exdir=targetDirectory, overwrite=TRUE)
    }
}