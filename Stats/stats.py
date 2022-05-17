import numpy as np
import pandas as pd

#dfstat = master_df[["token_tikuna","token_pos","token_spa","entry_type","synset_type","n_pos","n_tra"]]
# n pos
# pd.DataFrame(master_df.n_pos.value_counts())

def count_n_tok_tra(entry):
    if isinstance(entry,list):
        n_tokens = []
        for elem in entry:
            l_tok = elem.split(',')
            l_tok = len(l_tok)
            n_tokens.append(l_tok)             
    elif ',' not in entry:
        n_tokens = 1
    elif ',' in entry :
        l_tok = entry.split(',')
        n_tokens = len(l_tok)
    else :
        print(None)
    return(n_tokens)
def add_n_tok_tra(df):
    df['n_tok_trad'] = df['token_spa'].apply(lambda x : count_n_tok_tra(x))
    return(df)
# trad_counter = add_n_tok_tra(dfstat)

# Data quality
def missing_zero_values_table(df):
        zero_val = (df == 0.00).astype(int).sum(axis=0)
        mis_val = df.isnull().sum()
        mis_val_percent = 100 * df.isnull().sum() / len(df)
        mz_table = pd.concat([zero_val, mis_val, mis_val_percent], axis=1)
        mz_table = mz_table.rename(
        columns = {0 : 'Zero Values', 1 : 'Missing Values', 2 : '% of Total Values'})
        mz_table['Total Zero Missing Values'] = mz_table['Zero Values'] + mz_table['Missing Values']
        mz_table['% Total Zero Missing Values'] = 100 * mz_table['Total Zero Missing Values'] / len(df)
        mz_table['Data Type'] = df.dtypes
        mz_table = mz_table[
            mz_table.iloc[:,1] != 0].sort_values(
        '% of Total Values', ascending=False).round(1)
        print ("Your selected dataframe has " + str(df.shape[1]) + " columns and " + str(df.shape[0]) + " Rows.\n"      
            "There are " + str(mz_table.shape[0]) +
              " columns that have missing values.")
#         mz_table.to_excel('D:/sampledata/missing_and_zero_values.xlsx', freeze_panes=(1,0), index = False)
        return mz_table

#missing_zero_values_table(trad_counter)

#dferr = master_df
#(dferr['token_tikuna'].values == 'missing').sum()           #
#(dferr['spacy_pos'].values == 'missing').sum()           #
#(dferr['token_pos'].values == 'missing').sum()           #
#(dferr['token_spa'].values == 'missing').sum()    