# Randomized Gift Exchange Assignments
# Keegan Korthauer, Nov 2015

# Enter the name of each person in the gift exchange
Gifters <- c("PersonA", "PersonB", "PersonC", "PersonD", "PersonE", "PersonF", "PersonG", "PersonH", "PersonI")

# Enter any couples among the participants as pairs (1 row per couple)
relationships <- rbind(c("PersonB", "PersonC"),
                       c("PersonG", "PersonH"))

##### All Set! Obtain Randomized Assignments: #####
# set up matrix of possible assignments 
GifterMat <- matrix(1, nrow=length(Gifters), ncol=length(Gifters))
rownames(GifterMat) <- colnames(GifterMat) <- Gifters

# Don't allow for people in a relationship to shop for each other
for(j in 1:nrow(relationships)){
  GifterMat[rownames(GifterMat) %in%  relationships[j,],
            colnames(GifterMat) %in%  relationships[j,]] <- 0
}

# Don't allow people to shop for themselves
diag(GifterMat) <- 0

# set a Random Seed 
set.seed(30)   
picks <- cbind(Gifters, rep(NA, length(Gifters)))
colnames(picks) <- c("","Shops For:")

while(sum(is.na(picks[,2]))>0){
  for(r in 1:nrow(GifterMat)){
    # extract possible matches
    possible <- GifterMat[r,GifterMat[r,]==1]
    possible <- possible[ !(names(possible) %in% picks[,2]) ]
    
    # don't allow for 'loops' (two people shopping for each other)
    if (picks[r,1] %in% picks[,2]){
      looped <- picks[which(picks[r,1] == picks[,2]), 1] # who already picked this person
      possible <- possible[!(names(possible) %in% looped)] 
    }
    
    # randomly draw from the allowable people to shop for
    picks[r,2] <- sample(names(possible),1) 
  }
}
print(noquote(picks))
