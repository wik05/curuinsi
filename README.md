# Curuinsi Project

## Repositroy structure

```bash
├── Pipfile
├── Pipfile.lock
├── README.md
├── Stats
├── app
├── dic_preprocessing
├── nltk
├── project_doc
├── requirements.txt
├── text_preprocessing
└── venv
```

### venv
```python
source venv/bon/activate
```
### dic_preprocessing
Input  :  the converted PDF to text file with one line per entry of dictionary.
Output :  csv with all content from the dictionary entry tokenized.

### app
Streamlit app to interact with the dictionnary data base. Enter spanish word and if present, show tikuna translation.
Input : csv file with all content from the dictionary entry tokenized.

if dependencies are correctly installed, 

```python
streamlit run main.py # app lauch automatically in browser
```

### text_preprocessing

#### source list

| Acronym      | Author | Langage     |Original format|Source|
| :---         |    :----:   |          ---: |---:|--:|
|TS_DIC  | Anderson dictionnary | Tik-Spa |CSV||
|LLB_NEW |New Testament La Ligua Biblica |Tikuna|PDF||
|LLB_OLD |Old Testament La Ligua Biblica |Tikuna|PDF||
|T_Ebible|Ebible |Tikuna|HTML|https://ebible.org/bible/details.php?id=tcaNT|
|S_Ebible|EBible| Spanish|HTML|https://ebible.org/bible/details.php?id=spavbl|
|T_OHCR  |Universal Declaration Of Human Rights | Tikuna|TXT||
|S_OHCR  |Universal Declaration Of Human Rights  |Spanish|TXT||
|T_CRU  |Crubadan Synsets  |Tikuna|TXT||


 
