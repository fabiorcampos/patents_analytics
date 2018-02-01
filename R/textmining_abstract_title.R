library(tm)
library(wordcloud)

### Coonvert patens dataframe in a frame to Textmining
docs <- patents

### Creating a Corpus text
x <- Corpus(docs$content)

### Preparation data
x <- tm_map(x, content_transformer(tolower)) # tolower
x <- tm_map(x, removePunctuation) # remove ponctuation
x <- tm_map(x, removeNumbers) # remove numbers
x <- tm_map(x, removeWords, stopwords(kind = "en")) # remove stopwords

### Vectorial representation
corpus_tf <- TermDocumentMatrix(x, control = list(minWordLength = 3))

### tf-idf
corpus_tf_idf <- weightTfIdf(corpus_tf, normalize = TRUE)

### wordcloud 
matrix <- as.matrix(corpus_tf)


