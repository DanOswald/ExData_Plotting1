c4w1 <- read.table("../household_power_consumption.txt",
                   header = TRUE, na.strings = "?", sep = ";")
c4w1[, 1] <- as.Date(c4w1[, 1], format = "%d/%m/%Y")
c4w1 <- c4w1[c4w1[, 1] == "2007-02-01" | c4w1[, 1] == "2007-02-02", ]


png(file = "plot1.png")
hist(c4w1[, 3], main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()