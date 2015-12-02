# GiftExchange
Fun little R helper script to randomize assignments in a gift exchange pool

To use, first edit the 'Gifters' object to specify a list of names of the people in the exchange pool.

> Gifters <- c("PersonA", "PersonB", "PersonC", "PersonD", "PersonE", "PersonF", "PersonG", "PersonH", "PersonI")

Then, if you'd like to place any restrictions on the assignments based on relationships (i.e. don't allow significant others 
to give a gift to one another) edit the 'relationships' object to include the pairs of people (if any) that are in a relationship. In 
the example, PersonB is in a relationship with PersonC, and PersonG is in a relationship with PersonH.

> relationships <- rbind(c("PersonB", "PersonC"),
                         c("PersonG", "PersonH"))

If there are no relationship restrictions, simply assign NULL to relationships.

> relationships <- NULL

Then run the R script either interactively, or as a batch job to see the resulting assignment matrix!
