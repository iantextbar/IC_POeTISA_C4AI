# IC_POeTISA_C4AI
Repository with code from my undergraduate research project, done under professors Dr. Norton Trevisan and Dr. Ariani di Felippo at the POeTISA lab of the Center for Artificial Intelligence (USP+IBM+FAPESP). Data was mostly provided by previous work at the POeTISA lab, or kindly provided by [@bryankhelven](https://github.com/bryankhelven) as a result of his work on his masters thesis.

1. introdata.ipynb: Preprocesses the corpus from raw conllu data (available at https://sites.google.com/icmc.usp.br/poetisa/resources-and-tools?authuser=0) and tries to find predicate nouns from sequences of ADP + NOUN. Results were further refined by Bryan, using a dictionary of predicate nouns.

2. npreds_com_emocoes.ipynb: Merges the dataframe of tweets with predicate nouns found in the corpus and a dataframe containing the scores in each axis of emotions based on (R.PLUTCHIK, H.KELLERMAN, 1986). Creates frequency distributions over emotions for the tweets in the corpus and the subcorpora of tweets containing predicate nouns.

3. ks_test_bootstrapping.R: applies the Kolmogorov-Smirnov Test to check for any statistically significant difference between the distributions over emotions in the corpus and predicate noun subcorpus.

4. data_distribuicao_emot.R: Some graphs

5. tweet_with_npred_classification.ipynb: Fine-tunes BERTimbau (https://huggingface.co/neuralmind/bert-base-portuguese-cased) for the detection of tweets with predicate nouns.
