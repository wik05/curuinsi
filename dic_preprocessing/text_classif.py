import re
import pandas as pd

def categorize_entry(raw_text):
    cleaned_text = []
    label_entry = []
    for i,line in enumerate(raw_text): #pylint: disable=unused-variable
        subentry = re.search(r'^-\s+(.*)',line)
        if subentry :
            c_line = subentry.group(1)
            cleaned_text.append(c_line)
            label_entry.append('subentry')
        else :
            cleaned_text.append(line)
            label_entry.append('entry')
    df = pd.DataFrame(list(zip(cleaned_text,label_entry)), columns = ['dic_entry',
                                                                      'entry_type'])
    df['dic_entry'] = df['dic_entry'].str.strip()
    return(df)

# Extracted list of gramm. types that appear in doctionary to use for regex matchs
regex_dict_type = 'adj\\.|adv\\.|anim\\.|Antón\\.|art\\.|compl\\.|conj\\.|f\\.|fem\\.|fut\\.|inan\\.'\
                '|interj\\.|m\\.|masc\\.|pas\\.|pl\\.|posp\\.|pref\\. sust\\.|pref\\. verb\\.|prep\\.' \
                '|pres\\.|pron\\.|s\\.f\\.|sing\\.|Sinón\\.|s\\.m\\.|s\\.n\\.|suf\\. sust\\.|suf\\. verb\\.'\
                '|suj\\.|var\\.|v\\.e\\.|v\\.i\\.|v\\. recíp\\.|v\\. refl\\.|v\\.t\\.'

#Classify mono vs polysemic entries
#Check if 0, 1 or n pos types present
def categorize_synset(df):
    synset_type = []
    multiple_type = []
    for i,entry in enumerate(df.dic_entry): #pylint: disable=unused-variable
        synset_multiple = re.search(r'(?P<token_tikuna>[^(]*)'
                                    r'(?P<tik_oral>[^)]*\))(?P<rest>.*)',entry)
        if synset_multiple :
            rest = synset_multiple.group(3)
            has_num = re.search(r'(.*\d.*)',rest)
            if has_num :
                pos_num_1 = re.match(r'\s*\d',has_num.group(0))
                pos_pos_1 = re.search(r'^\s*%s\s*.*'%regex_dict_type,has_num.group(0))
                if pos_num_1 :
                    synset_type.append('multi_n_pos')
                elif pos_pos_1:
                    synset_type.append('multi_1_pos')
            else: 
                synset_pos = re.search(r'(?P<token_tikuna>[^(]*)(?P<tik_oral>[^)]*\))\s*'
                                       r'(?P<pos_tag>%s)(?P<token_spanish>[\sa-záéíñóúü,]*)'
                                           % regex_dict_type,entry)
                synset_no_pos = re.search(r'(?P<token_tikuna>[^(]*)(?P<tik_oral>[^)]*\))'
                                  r'(?P<token_spanish>.*)',entry)
                if synset_pos:
                    synset_type.append('mono_pos')
                    multiple_type.append(None)
                elif synset_no_pos:
                    synset_type.append('mono_no_pos')
                    multiple_type.append(None)
    df['synset_type'] = synset_type
    df.loc[(df['entry_type'] == 'subentry' ) & (df['synset_type'] == 'mono_pos') ,\
                                'synset_type'] = 'mono_no_pos'
    return(df)

# Function with specific regex per entry types
def tokenize_mono_pos(entry):
    synset_pos = re.findall(r'(?P<token_tikuna>[^(]*)(?P<tik_oral>[^)]*\))\s*'
                            r'(?P<pos_tag>%s)(?P<token_spanish>[\sa-záéíñóúü,¡!]*)'
                               % regex_dict_type,entry)

    tokenized_entry = synset_pos
    return(tokenized_entry)
def tokenize_mono_no_pos(entry):
    synset_no_pos = re.search(r'(?P<token_tikuna>[^(]*)(?P<tik_oral>[^)]*\))'
                               r'(?P<rest>.*)',entry)
    part1 = synset_no_pos.group(1,2)
    part2 = re.search(r'[\sa-záéíñóúü,¡!\(\)]*$',synset_no_pos.group(3),re.MULTILINE)

    tokenized_entry = [part1,part2.group()]
    return(tokenized_entry)
def tokenize_multi_1_pos(entry):
    synset_multiple = re.search(r'(?P<token_tikuna>[^(]*)(?P<tik_oral>[^)]*\))\s*'
                                 r'(?P<pos>%s)\s*\s*(?P<rest>.*)'
                                    %regex_dict_type,entry)
    part1 = synset_multiple.group(1,2,3)
    part2 = re.findall(r'(?P<num>\d\.)\s*(?P<token_spanish>[\sa-záéíñóúü,¡!]*)'
                       ,synset_multiple.group(4))
    tokenized_entry = [part1]
    spa_list = []
    for i in part2:
        spa_list.append(i[1])
    tokenized_entry.append(spa_list)
    return(tokenized_entry)
def tokenize_multi_n_pos(entry):
    synset_multiple = re.search(r'(?P<token_tikuna>[^(]*)(?P<tik_oral>[^)]*\))\s*'
                                r'(?P<rest>.*)'
                                ,entry)
    part1 = synset_multiple.group(1,2)
    part2 = re.findall(r'(?P<num>\d\.)\s*(?P<pos>%s)'
                       r'(?P<token_spanish>[\sa-záéíñóúü,¡!]*)'%regex_dict_type,synset_multiple.group(3))
    tokenized_entry = [part1]
    pos_list = []
    spa_list = []
    for i in part2:
        pos_list.append(i[1])
        spa_list.append(i[2])  
    tokenized_entry.append(pos_list)
    tokenized_entry.append(spa_list)
    return(tokenized_entry)

# Use epceifics functions from above to classify content of each entries
def tokenize_entry(df):
    entry  = df['dic_entry']
    syn = df['synset_type']
    if syn == 'mono_pos':
        tokenized_entry = tokenize_mono_pos(entry)
        df['tokenized_entry'] = tokenized_entry
        df['token_tikuna'] = tokenized_entry[0][0]
        df['token_oral'] = tokenized_entry[0][1]
        df['token_pos'] = tokenized_entry[0][2]
        df['n_pos'] = '1'
        df['token_spa'] = tokenized_entry[0][3]
        df['n_tra'] = '1'
        # rejouter if more then add this info
        #x['token_spec'] = ''
        #x['token_example'] = ''    
    elif syn == 'mono_no_pos':
        tokenized_entry = tokenize_mono_no_pos(entry)
        df['tokenized_entry'] = tokenized_entry
        df['token_tikuna'] = tokenized_entry[0][0]
        df['token_oral'] = tokenized_entry[0][1]
        df['token_pos'] = None
        df['n_pos'] = None
        df['token_spa'] = tokenized_entry[1]
        df['n_tra'] = '1'       
    elif syn == 'multi_1_pos':
        tokenized_entry = tokenize_multi_1_pos(entry)
        df['tokenized_entry'] = tokenized_entry
        df['token_tikuna'] = tokenized_entry[0][0]
        df['token_oral'] = tokenized_entry[0][1]
        df['token_pos'] = tokenized_entry[0][2]
        df['n_pos'] = '1'
        df['token_spa'] = tokenized_entry[1]
        df['n_tra'] = len(tokenized_entry[1])       
    elif syn == 'multi_n_pos':
        tokenized_entry = tokenize_multi_n_pos(entry)
        df['tokenized_entry'] = tokenized_entry
        df['token_tikuna'] = tokenized_entry[0][0]
        df['token_oral'] = tokenized_entry[0][1]
        df['token_pos'] = tokenized_entry[1]
        df['n_pos'] = len(tokenized_entry[1])
        df['token_spa'] = tokenized_entry[2]
        df['n_tra'] = len(tokenized_entry[2])
    return(df)

def tokenize_examples(df):
    example = []
    for i in range(df.shape[0]):
        str = df['dic_entry'][i]
        match = re.search(r'([A-Z].*\.)',str)
        if match:
            str2 = match.group(0)
            match2 = re.search(r'[\(]',str2)
            if match2:
                example.append('')
            else:
                example.append(match.group(0))
        else:
            example.append('')
        # * cases, tikuna esp
        # mismatch an entry without pos tag
        # Spanish descritpion of meaning
    df['example'] = example

    # In the Content captured with the Uppercase, not everything is Tikuna.
    # The cleaning focuses on removing the content begining with Var. referecing to another entry.
    # The [Tikuna sense][.][space][Sanish sentence][.] Pattern capture most of the content with the first regex.

    example_spanish = []
    example_tikuna = []
    exclude = [None,'',' ','Var.','\n','\t','\r','\f']
    annotated_examples = 0
    other_text = 0
    to_review = 0
    for i in range(df.shape[0]):
        str = df['example'][i]
        match = re.search(r'(?P<tikuna>[A-Z].*(\.|\!|\?|\¿))\s*'
        r'(?P<spanish>.?[A-ZÈÉ].*(\.|\!|\?|\¿))',str)
        if match:
            example_tikuna.append(match.group(1))
            example_spanish.append(match.group(3))
            annotated_examples += 1
        else:
            example_tikuna.append('')
            example_spanish.append('')
            if df['example'][i] not in exclude:
                str = df['example'][i]
                match = re.search(r'[A-Z].*\.?\s?[A-Z].*\.?',str)
                if match:
                    #print(df['example'][i])
                    match2 = re.search(r'(Indica|Se usa|\[])',str)
                    if match2:
                        other_text +=1
                    else:
                        df['example'][i] = re.sub(r'(\s+([A-Z]))',r'\.\1',str)
                else:
                    #print(df['example'][i])
                    to_review += 1
    df['example_tikuna'] = example_tikuna
    df['example_spanish'] = example_spanish
# total = df.shape[0]
# empty = total -  annotated_examples
# feedback = pd.DataFrame([[annotated_examples,other_text,to_review,empty,total]],columns=['full_example','other','to_review','empty_examples','total_entries'])
# feedback
    return(df)