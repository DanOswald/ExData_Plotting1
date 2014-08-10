c4w1 <- read.table("../household_power_consumption.txt",
                   header = TRUE, na.strings = "?", sep = ";")
c4w1[, 1] <- as.Date(c4w1[, 1], format = "%d/%m/%Y")
c4w1 <- c4w1[c4w1[, 1] == "2007-02-01" | c4w1[, 1] == "2007-02-02", ]
z <- strptime(paste(c4w1[, 1], c4w1[, 2]), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")

par(mfcol = c(2, 2))

plot(z, c4w1[, 3], type = "n", xlab = "", ylab = "Global Active Power")
lines(z, c4w1[, 3])

plot(z, c4w1[, 7],
     type = "n", xlab = "", ylab = "Energy sub metering")
lines(z, c4w1[, 7], col = "black")
lines(z, c4w1[, 8], col = "red")
lines(z, c4w1[, 9], col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(z, c4w1[, 5], type = "n", yaxt="n", xlab = "datetime", ylab = "Voltage")
box()
axis(2, at = c(234, 236, 238, 240, 242, 244, 246),
     labels = c(234, "", 238, "", 242, "", 246) )
lines(z, c4w1[, 5])

plot(z, c4w1[, 4], type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(z, c4w1[, 4])


dev.off()