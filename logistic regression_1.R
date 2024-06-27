# Run a logistic regression using glm in R

# Set up the fly data
Dead<-c(1,3,2,4,5)
Alive<-c(4,2,3,1,0)
DeadAlive<-cbind(Dead,Alive)
DeadAlive

# Dose values
dose<-c(0.01,0.1,1,10,100)
#because the dose values are separated by factor of 10

# Make data frame including log transformed predictor variables
ldose<-log10(dose)
ldose

flydata<-data.frame(Dead,Alive,ldose)

# Plot the data
plot(ldose,Dead/(Alive+Dead), xlab="Log(Dose)",ylab="Mortality", pch = 19)

# Do a logistic regression
logregr<-glm(DeadAlive~ldose,family=binomial)
summary(logregr)
# Couple of ways to specify 

# Predict the mean for each dose on the response scale
# Type= "response" is essential here, otherwise the results make no sense
probs = predict(logregr, type = "response")

# Add to plot
newdoses = data.frame(ldose = seq(-4,4,0.1))
probs2 = predict(logregr, type = "response", newdata = newdoses)
plot(ldose,Dead/(Alive+Dead), xlab="Log(Dose)",ylab="Mortality", pch = 19)
lines(newdoses$ldose, probs2 ,col="blue")
# Notice how the line looks like what we see in the lecture? This is how it should look like! Do not forget to back transform
# Logistic regression line. If we want to kill 80% of the flies, look at the y and x axis.
