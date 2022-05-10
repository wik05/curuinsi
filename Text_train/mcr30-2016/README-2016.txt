
Multilingual Central Repository 3.0 (Release 2016)
--------------------------------------------------

Table of Content:
1. Introduction
2. Changes with respect to MCR3.0 (Release 2012) 
3. Content of the distribution
4. Database design of the MCR 3.0
5. Additional information
6. Research groups involved
7. Contact information


1. Introduction
---------------

Version 3.0 (release 2016) of the Multilingual Central Repository
is a result of the 5th Framework MEANING project (IST-2001-34460) and 
Spanish government KNOW (TIN2006-15049-C03), KNOW2 (TIN2009-14715-C04-01), 
SKaTer (TIN2012-38584-C06) and TUNER (TIN2015-65308-C5) projects.

The MCR 3.0 currently integrates in the same EuroWordNet framework wordnet 
versions for six different languages: English, Spanish, Catalan, Basque, 
Galician and Portuguese. The Inter-Lingual-Index (ILI) allows the connection from
words in one language to their equivalent translations in any of the other
languages. The current ILI version corresponds to Princeton WordNet
3.0. Furthermore, the MCR is enriched with the semantically tagged glosses:
http://wordnet.princeton.edu/glosstag.shtml

The MCR also integrates WordNet Domains, the Top Ontology, AdimenSUMO 
ontology and a new version of the Basic Level Concepts. In that way, 
the MCR constitutes a natural multilingual large-scale semantic 
resource for a number of semantic processes that need large amount of 
multilingual knowledge to be effective tools.

The current content of the MCR 3.0 can be consulted using the Web
EuroWordNet Interface (WEI):
http://adimen.si.ehu.es/web/MCR

Information about the different versions of the MCR can be found at:
http://adimen.si.ehu.es/wikiMCR/index.php/MCR

For more details on the MCR 3.0 contents, including references to the
original resources, please consult the following paper:

Gonzalez-Agirre A., Laparra E. and Rigau G. Multilingual Central
Repository version 3.0: upgrading a very large lexical knowledge
base. In Proceedings of the Sixth International Global WordNet
Conference (GWC’12). Matsue, Japan. January, 2012.

which can be downloaded at:
http://adimen.si.ehu.es/~rigau/publications/gwc12-glr.pdf


2. Changes with respect to MCR3.0 (Release 2012) 
------------------------------------------------

For further information about the MCR 3.0 release 2012 please check:
http://adimen.si.ehu.es/web/files/mcr30/README.txt

2.1) Changes in the MCR structure:
==================================

* A new table (wei_ili_to_blc) for storing information about Basic Level 
Concepts (see section 4). 

2.2) Changes in the MCR content:
================================

2.2.1) New Portuguese wordnet.

* Added five new tables for storing the Portuguese wordnet (see section 3).

2.2.2) New variants.

* Added new variants to for Spanish, Catalan, Basque and Galician wordnets 
(see section 3).

2.2.3) New encoding for the MCR relations: 

* MCR-relations.pdf file (also included in this distribution) describes the 
current lexico-semantic relations encoded into the MCR. 

2.2.4) New BLCs.

* A new version of Basic Level Concepts (BLC) have been uploaded (see section 3).

2.2.5) Minor issues.

* Deleted TOP tag from wei domains table.

* New relation and group of relations schema. 

* Fixed cycles and minor discrepancies between variants, synsets, ILIs and 
relations in some wordnets.


3. Contents of the distribution
-------------------------------

The MCR 3.0 (release 2016) consists of the following directories and files:

AdimenSUMO/		Mappings to AdimenSUMO classes
BLC/			Mappings to Basic Level Concepts
catWN/			Catalan WordNet
data/			ILI, relations, relations groups, lexnames
Domains/		Mappings to WN Domains labels
engWN/			English WordNet
eusWN/			Basque WordNet
glgWN/			Galician Wordnet
LICENCE.txt		Licenses
Marks/			Variant and Synset marks
MCR-relations.pdf	Relations encoded
mysql/                  Instructions to create the database in mysql
porWN/			Portuguese WordNet
README-2016.txt         README file
spaWN/ 			Spanish WordNet
TopOntology/		Mappings to Top Ontology properties

The MCR 3.0 (release 2016) includes wordnets for six languages, namely, 
English (from Princeton WordNet 3.0), Catalan, Basque, Galician, Portuguese 
and Spanish wordnets.

The MCR now integrates the Portuguese WordNet (PULO) developed by Alberto 
Simões at the University of Minho. See http://wordnet.pt/ for further details.

The new release also integrates a large set of new variants associated to
the different wordnet synsets. For instance, now the Spanish WordNet contains 
146261 variants (57984 variants in the previous release from 2012), that is
almost three times larger. Furthermore, the Spanish WordNet also covers the double 
of synsets. That is, from 38702 synsets covered by at least one Spanish 
variant in the past 2012 release (33% of the English WordNet) to 78958 synsets 
(67% of the English WordNet) in the current release. The next subsections describe 
the current MCR figures.

This new release also includes a new version of the Basic Level Concepts (BLCs)
obtained when using a threshold of 20 and a new all+gloss relations criteria 
for selecting the maximums in the hypernym chain.
See http://adimen.si.ehu.es/web/BLC for further details.

3.1) Variants
=============

WN       Nouns  Verbs   Adjectives      Adverbs Synsets

catWN    73670  14619   11213           1152    60928
engWN    147245 25051   30082           5580    118408
eusWN    40420  9469    148             0       30263
glgWN    35875  6439    9877            992     34812
porWN    17149  8407    6330            789     17942
spaWN    100788 20952   20938           3583    78958

3.2) Glosses
============

WN	Nouns	Verbs	Adjectives	Adverbs	Synsets

catWN	6900	52	1157		1	8110
engWN	82239	13767	18180		3621	117807
eusWN	2854	78	0		0	2932
glgWN	5512	29	3145		19	8706
porWN	82173	13767	18156		3621	117717
spaWN	13541	3477	2127		687	19832

3.3) Ontologies
===============

AdimenSUMO	121181 ILI assignments to 896 AdimenSUMO classes.
Top Ontology 	339582 ILI assignments to 66 Top Ontology properties.
WordNet Domains 146905 ILI assignments to 170 domain labels.
BLC		95882 ILI assignments to 1427 Basic Level Concepts.

4. Database design of the MCR 3.0
---------------------------------

The MCR 3.0 is structured as a relational database consisting of 44
tables. The main table of the MCR 3.0, wei_ili_record, located in 
the data directory and it provides the Inter-Lingual Index (ILI).

-  wei_ili_record: Contains the ILI identifier, in the format
   'ili-30-xxxxxxxx-y', where "xxxxxxxx" is a 8 digit offset number and
   "y" represents the part of speech: 'n' corresponds to noun, 'v' to
   verb, 'a' to adjective and 'r' to adverb. Each entry also displays
   the source of the ILI (the WordNet of origin), the lexicographic file 
   from WordNet, and whether it is an instance or not.

The rest of the tables in the data directory are the following:

-  wei_relations: This table contains the relations offered by the 
   MCR 3.0 (release 2016). Every relation has an identifier, name, 
   properties and a note (optional). Other attributes indicates the 
   inverse of the relation (if any) and to which group the relations 
   does belong. The ID that appears in this table is later used in the 
   'wei_$LANG-30_relation' tables to identify each relation.

   MCR-relations.pdf file (also included in this distribution) describes 
   the current lexico-semantic relations encoded in the MCR (mainly 
   derived from those defined in the EuroWordNet project) and its 
   relation to those from the original Princeton WordNet.

   The props atribute is a four character string coding four different
   properties: 't' means that the relation is transitive, 's' that the
   original relation in WordNet is between word senses, 'i' that the
   relation has an inverse relation (appearing in the inverse atribute)
   and 'n' to indicate when the relation is not encoded in the database
   (when it is encoded its inverse relation). For instance, 'has_hyponym'
   is transitive, appears between synsets, its inverse relation is
   'has_hyperonym' and it is the one encoded in the database. Thus,
   'has_hyperonym' is not encoded.

-  wei_relations_group: This table stores the supergroups of relations
   (synonyms, Hyperonyms, Meronyms, Causes, ...). The supergroup to
   which each relations corresponds is used in the "wei_relations"
   table described above.

-  wei_lexnames: This table indicates the WordNet lexicographic files.
   Each entry has a code which is later used in the 'semf' attribute
   indicated in 'wei_ili_record' table plus a descriptive name.

Every language included in the MCR 3.0 (including English) is linked
to the ILI. Each WordNet is composed of 5 tables. Each language has
its own 3-letter code, indicated by $LANG, in the following tables:

-  wei_$LANG-30_to_ili: It establishes a correspondence between the ILI
   with the synset offset for each the 5 languages of the MCR 3.0. This
   way, all 5 languages are connected.

-  wei_$LANG-30_relation: This table contains the relations for each
   language. Each relation has the following attributes: the type of relation,
   as indicated in the catalogue of relations listed in the table 'wei_relations',
   the direction of the relation (source synset and target synset),
   the value of the confidence score, and the wordnet of origin.

-  wei_$LANG-30_synset: Properties of every synset for each language
   including an identifier, total number of descendants, gloss (if any),
   maximum number of levels in its hierarchy, the level number counting
   from the top, and finally the mark of the synset.

-  wei_$LANG-30_variant: The variants are stored in this table. Each
   entry represents a single variant and stores the following
   information: word, sense, the synset offset, the confidence score,
   the experiment it comes from (optional), and finally the mark and
   the note of the variant. The confidence score ranges from 50 to 99
   and it establishes a value for the association between the variant
   and the synset and it depends on the method used to acquire the
   association. Manually revised associations usually have a confidence
   score of 99.

-  wei_$LANG-30_examples: This table contains examples (if any) for
   each synset. Each example is identified by the synset offset, pos,
   word and sense.

Anyone interested in adding a new language to the MCR 3.0 needs to
create the 5 tables contained in the directories of the 5 WordNets.
The tables should follow the same naming patterns plus 3-letter code
to represent it. The three letter codes follow:

http://en.wikipedia.org/wiki/List_of_ISO_639-2_codes

Furthermore, the MCR 3.0 integrates ontological knowledge from three
different sources: AdimenSUMO, Top Ontology and WordNet Domains.
The mappings between these ontological resources and the ILI is
language independent.

Domains:

-  wei_domains: This table represents the WordNet domains hierarchy
   using source-target tuples.

-  wei_ili_to_domains:  Each entry links a domain label to an ILI. It
   also indicates the WordNet of origin. This table is unique for all
   languages. In other words, that information related to domains is
   general and not language-dependent.

AdimenSUMO:

-  wei_sumo_relations: This table represent the AdimenSUMO hierarchy
   using source-target tuples. It also has a field that indicates
   whether it is a subclass.

-  wei_ili_to_sumo:  Each entry links an AdimenSUMO label to an ILI. It
   also indicates the WordNet of origin. This information is language
   independent.

BLC:

-  wei_ili_to_blc: Each entry establishes a correspondence between an
   ILI and the Basic Level Concept associated to it.

Top Ontology:

-  wei_to_relations: This table represents the Top Ontology hierarchy
   using source-target tuples. It also has a field that indicates the
   type of the relation.

-  wei_ili_to_to: Each entry establishes a correspondence between an
   ILI and a property in the Top Ontology and the source WordNet.

-  wei_to_record:  It offers a short description for each type of
   Top Ontology property.

Marks:

-  mark_values_synset: Possible values for synsets marks as well as its
   description.

-  mark_values_variant: Possible values for variant marks as well as
   its description.


5. Additional information
-------------------------

Ongoing development work on the MCR is done by a small group of
researchers. Since our resources are VERY limited, we request that
you please confine correspondence to the MCR topics only. Please
check carefully this documentation and other resources to answer
to your question or problem before contacting us.

English Princeton WordNet:
http://wordnet.princeton.edu

EuroWordNet project:
http://www.illc.uva.nl/EuroWordNet

WordNet Domains:
http://wndomains.fbk.eu

AdimenSUMO:
http://adimen.si.ehu.es/web/adimenSUMO

Meaning project:
http://nlp.lsi.upc.edu/projectes/meaning

KNOW project:
http://ixa.si.ehu.es/know

KNOW2 project:
http://ixa.si.ehu.es/know2

SKaTer project:
http://nlp.lsi.upc.edu/skater

TUNER project:
http://ixa.si.ehu.es/tuner

Multilingual Central Repository:
http://adimen.si.ehu.es/web/MCR

Galnet project:
http://sli.uvigo.gal/galnet

PULO project:
http://wordnet.pt

6. Research groups involved
---------------------------

GRIAL 	http://grial.uab.es
IULA	http://www.iula.upf.edu
IXA	http://ixa.si.ehu.es
NLPG	http://nlp.lsi.upc.edu
SLI 	http://sli.uvigo.gal

7. Contact information
----------------------

German Rigau
IXA Group
University of the Basque Country
E-20018 San Sebastián

mcr-users@googlegroups.com

