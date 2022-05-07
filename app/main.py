import streamlit as st
import pandas as pd

### UI ###

st.markdown('# Curuinsi Project')
st.markdown('## Interactive linguistic database for the tikuna language')
st.markdown('[Gitlab Repository](www.gitlab.com)')
st.markdown('### Query Database')
st.markdown('Enter spanish word and check it\'s tikuna translation')
spa_token = st.text_input('Spanish Word')

### DATA TRANSFORMATION ###

# Import cleaner version / lighter v.
# Clean data, one element / dict inside
df = pd.read_csv('output.csv')
# fix paths to rela

### Find match ###

def findMatch(token):
    dic_entry = df[df['token_spa'].str.contains(token)==True]
    if dic_entry.empty:
        dic_entry = None
    return(dic_entry)
if spa_token:
    dic_entry = findMatch(spa_token)
    if dic_entry is not None:
        st.dataframe(dic_entry)
    else:
        st.error('Currently no match in Database')
### Data Vizualization ###
st.markdown('### Data Visualizer')

# if check box, print the dataframe for interaction
checked = st.checkbox('Show the full database')
if checked:
    st.write(df)