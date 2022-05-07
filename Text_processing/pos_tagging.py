spacy.load('es_core_news_lg')
import es_core_news_lg
nlp = es_core_news_lg.load()

# Still need for full df ?
def token_to_pos(x):
    if x != '':
        if (len(x)) > 1:
            if type(x) is str:
                to_tag  = (x.split(','))
            elif type(x) is list:
                to_tag = x
        # Tager un mot
        # Tager une suite de mots
        # 
        x = to_tag
    return(x)
def add_POS(df):
    df['added_pos_spacy'] = df['token_spa'].apply(token_to_pos)
    return(df)

add_POS(master_df.sample(10))

# POS comparision. Remap names from dic to match NTK ones
# benchmarker comparaison added et vrai pos
# Mais aussi transfo le dic pos en format NLTK
# Est ce bon format ? pratique car plus simple que le vrai NLTK, mais peut faire trtansfo pour
# format de base
def pos_switcher(pos):
    pos_switcher = {
        'interj.' : 'INTJ',
        'conj.'   : 'CONJ',
        'adj.'    : 'ADj',
        'adv.'     : 'ADV',
        'art.' : 'DET',
        'prosp.' : 'ADP',
        'prep.' : 'ADP',
        'pron.' : 'PRON',
        's.n' : 'NOUN',
        's.f.' : 'NOUN',
        's.m.' : 'NOUN',
        'v.i.' : 'VERB',
        'v. refl.' : 'VERB',
        'v.t.' : 'VERB',
        'v. recip' : 'VERB',
         'v. e.' : 'VERB',
         'suf. sust.' : 'X',
       'suf verb.'  :'X',
       'pref. sust.':'X',
       'pref. verb.':'X'
    }
    NLTK_pos = pos_switcher.get(pos,'no_pos')
    return(NLTK_pos)
def transform_pos(df):
    for i, line in enumerate(df.pos_tag):          
        df.loc[i]['NLTK_pos'] = pos_switcher(line)
    return(df)

import spacy
import es_core_news_lg
#test_pos  = master_df.loc[(master_df['synset_type'] == 'mono_pos')]
def sel_str_to_tag(token_spa):
    if type(token_spa) is str:
        match = re.search('\w+',token_spa)
        if match:
            str_to_tag = match.group()
        else :
            str_to_tag = 'missing'
    elif type(token_spa) is list:
        str_to_tag =  []
        for tok in token_spa:
            split_tag = tok.split(',')
            str_to_tag.append(split_tag[0])
            
        #print(str_to_tag)
    return(str_to_tag)
def spacy_tag(string_pos):
    if type(string_pos) is str :
        doc = nlp(string_pos)
        if len(doc) == 1:
            spacy_pos = ([w.pos_ for w in doc])
        else :
            spacy_pos = 'missing'
    elif type(string_pos) is list:
        list_pos = []
        #print(len(string_pos))
        for tok in string_pos:
            tok = tok.strip()
            doc = nlp(tok)
            if len(doc) == 1:
                spacy_pos = ([w.pos_ for w in doc])
                list_pos.append(spacy_pos)
            else :
                list_pos.append('missing')
                     
        #print(list_pos)
        spacy_pos = list_pos
    else:
        spacy_pos = [('missing','missing')]
    
    
    return(spacy_pos)
def testo_p(df):
    df['string_pos'] = df['token_spa'].apply(sel_str_to_tag)
    df['spacy_pos'] = df['string_pos'].apply(spacy_tag)
    
    return(df)