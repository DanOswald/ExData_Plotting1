c4w1 <- read.table("../household_power_consumption.txt",
                   header = TRUE, na.strings = "?", sep = ";")
c4w1[, 1] <- as.Date(c4w1[, 1], format = "%d/%m/%Y")
c4w1 <- c4w1[c4w1[, 1] == "2007-02-01" | c4w1[, 1] == "2007-02-02", ]
z <- strptime(paste(c4w1[, 1], c4w1[, 2]), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")
plot(z, c4w1[, 3],
     type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(z, c4w1[, 3])
dev.off()