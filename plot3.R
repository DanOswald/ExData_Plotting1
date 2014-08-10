c4w1 <- read.table("../household_power_consumption.txt",
                   header = TRUE, na.strings = "?", sep = ";")
c4w1[, 1] <- as.Date(c4w1[, 1], format = "%d/%m/%Y")
c4w1 <- c4w1[c4w1[, 1] == "2007-02-01" | c4w1[, 1] == "2007-02-02", ]
z <- strptime(paste(c4w1[, 1], c4w1[, 2]), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png")
plot(z, c4w1[, 7],
     type = "n", xlab = "", ylab = "Energy sub metering")
lines(z, c4w1[, 7], col = "black")
lines(z, c4w1[, 8], col = "red")
lines(z, c4w1[, 9], col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()