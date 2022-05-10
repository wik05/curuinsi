from text_classif import categorize_entry,categorize_synset,tokenize_entry

txt = open('pdf_to_text3.txt','r', encoding ='utf-8').readlines()

#Categorize entries following the source dict classif
#Entries are main, subentries are derivatives of entries 
df = categorize_entry(txt)
# categorizes synset in 4 groups from mono vs polysemy and presence of grammar information
df = categorize_synset(df)
master_df = df.apply(tokenize_entry,axis=1)
  
master_dfl = master_df[['token_tikuna','token_oral','token_pos','token_spa','entry_type','synset_type','n_pos','n_tra','dic_entry','tokenized_entry']]
master_dl = master_df[['token_tikuna','token_oral','token_pos','token_spa','dic_entry']]
# cleaning before outputing
# lists of spa token !
#
master_dl['token_spa'] = master_dl['token_spa'].str.strip()
## Do spacy tagging 
# Generate CSV to send to app TODO : pass a df ?
master_dl.to_csv('output.csv', index=False)

