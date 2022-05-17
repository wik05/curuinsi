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
'''python
source venv/bon/activate
'''
### Dic_preprocessing
Input  :  the converted PDF to text file with one line per entry of dictionary.
Output :  csv with all content from the dictionary entry tokenized.

### App
Streamlit app to interact with the dictionnary data base. Enter spanish word and if present, show tikuna translation.
Input : csv file with all content from the dictionary entry tokenized.

if dependencies are correctly installed, 

'''python
streamlit run main.py # app lauch automatically in browser
'''

### text_preprocessing
Convert and clean various data available in spanish and in tikuna.
Create a dictionary with content aligned.


 
