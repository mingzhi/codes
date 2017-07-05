readcorr = function(read) {
    filename = paste(read, "_fit_results.csv", sep = "")
    filepath = file.path("data", filename)
    d = read.csv(filepath)
    d$read = read
    d$group = NULL
    if (d$fbar < 200 | d$sample_d < 0.0011) {
        return(NULL)
    }
    d
}

samples = read.table("diverse_samples.txt", header=F)$V1
data = do.call("rbind", lapply(samples, readcorr))
library(dplyr)
data = data %>% arrange(theta)
write.csv(data, "fit_results.csv", quote=F, row.names=F)