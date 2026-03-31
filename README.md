# Jupyter Notebook NT, Ancient Greek and NLP. 

What the Sheol is that? 🤣 

- 🏛 Ancient Greek NT original texts
- 🤖 Natural Language Processing (NLP) Python libraries 

This project uses `spaCy` Python lib and and the [OdyCy Transformer model](https://centre-for-humanities-computing.github.io/odyCy/) ([Hugginface](https://huggingface.co/chcaa/grc_odycy_joint_trf), [Github](https://github.com/centre-for-humanities-computing/odyCy)) for Ancient Greek.

[`spaCy`](https://spacy.io/) is an industrial-strength, production-ready Python library for advanced Natural Language Processing (NLP). It leverages optimized pipelines and pre-trained transformer models to deliver high-performance tokenization, Named Entity Recognition (NER), and dependency parsing at scale.

[OdyCy](https://centre-for-humanities-computing.github.io/odyCy/) is extending `spaCy`: it's a transformer-based NLP library for Ancient Greek, capable of part-of-speech tagging, morphological analysis, dependency parsing, lemmatization and more.

[`Jupyter`](https://jupyter.org/) Notebook is an open-source, web-based interactive computing environment that enables developers to integrate live code, narrative documentation, and rich-media visualizations into a single reproducible document for data science and machine learning workflows. See [https://developers.google.com/colab](https://developers.google.com/colab) (can leverages GDrive-hosted notebooks).

Python is the more indented than any beast of the Shell, but has nothing to do with Gn 3:1.

### Performances

On a Macbook Air M4 / 16 Go, the parsing of the full Mark (Greek) text takes only ~8 seconds.

## Project Notebooks

This repository includes several Jupyter notebooks designed to demonstrate and analyze Ancient Greek texts using different approaches:

- [Introduction to Text-Fabric: A Microscope for Ancient Texts 🔬](./Intro_to_TextFabric_N1904.ipynb): An accessible, code-light introduction to reading ancient texts as interconnected databases. It demonstrates how to load a specific verse (Mark 1:1), peer "under the hood" at the grammatical tags (features) assigned to each word, and generate a beautiful, 3-line interlinear display showing the original Greek, its root dictionary form, and a literal English translation.
  *Technical:* Uses the `text-fabric` Python library and the local `CenterBLC/N1904` Greek New Testament dataset. Reconstructs text displays via `pandas` DataFrames and custom HTML/CSS rendering.

- [Visualizing Grammatical Dependencies in Mark 4:14 🌱](./Mark_4_14_Dependency_Visualization.ipynb): Renders a visual diagram of the grammatical structure of a single Greek verse (Mark 4:14 — "The farmer sows the word"), showing which words depend on which — like a sentence diagram. A good entry point for understanding how Ancient Greek syntax works.
  *Technical:* Dependency parsing via `spaCy` with the `grc_odycy_joint_trf` transformer model. Visualization rendered inline using `displaCy`.

- [Who Are the Main Characters in the Gospel of Mark? 👤](./Mark_Person_Names_Frequency.ipynb): Answers the question "Who are the main characters in Mark's Gospel?" by automatically finding and counting every name mentioned. Produces an easy-to-read, top-20 bar chart showing who dominates the narrative, designed with accessible explanations for non-specialists.
  *Technical:* Named entity / POS tagging (`PROPN`) via `spaCy` + `grc_odycy_joint_trf`. Frequencies counted with `collections.Counter`. English translations resolved via STEPBible TBESG lexicon. Data mapped and plotted using `pandas` and `matplotlib`.

- [Mark - Places Names & Geolocation](./Mark_Places_Names-Geoloc.ipynb): Extracts every place name from the Gospel of Mark and plots them on an interactive map, letting you visually trace Jesus’s journeys across ancient Galilee, Judea, and surrounding regions. Now includes a frequency bar chart and accessible explanations for non-specialists.
  *Technical:* Place name extraction via POS tagging (`spaCy` + `grc_odycy_joint_trf`). Coordinates sourced from the bundled `data/NT/Proper_Nouns/places.json` dataset (originally from STEPBible). Bar chart plotted via `matplotlib` and interactive map rendered with `folium`.

- [Mark - The Top 10 Verbs](./Mark_Top_Ten_Verbs.ipynb): Identifies the ten most-used verbs in the Gospel of Mark, giving a quick window into the book’s action-driven style — Mark’s Greek is famously fast-paced and verb-heavy.
  *Technical:* Lemmatization and POS filtering (`VERB`) via `spaCy` + `grc_odycy_joint_trf`. Frequency ranking with `pandas`, visualized as a bar chart with `matplotlib`.

- [How Many Words Do You Need to Know to Read the Gospel of Mark? 📖](./Mark_Vocabulary_Coverage.ipynb): Answers the question every Greek learner asks: "How many words do I actually need to know?" It turns out that mastering just 215 unique words gives you 80% comprehension of Mark — a motivating benchmark for beginners studying Ancient Greek.
  *Technical:* Lemma-based vocabulary analysis via `spaCy` + `grc_odycy_joint_trf`. Coverage curve computed with `pandas` (cumulative frequency thresholds at 50%, 60%, 75%, 80%, 90%), visualized with `matplotlib`.

- [Who Are the Main Characters in the Gospel of John? 👤](./John_Person_Names_Frequency.ipynb): Generates a ranked list of every person mentioned in the Gospel of John, showing which figures appear most often — from Jesus and Peter down to minor characters. A useful reference for readers wanting to understand the cast and relative prominence of each figure. Now includes a top-20 frequency bar chart and accessible explanations for non-specialists.
  *Technical:* Frequency analysis using `collections.Counter`. Resolves Greek proper nouns to English names via the bundled `data/NT/Proper_Nouns/people.json` lexicon (Strong’s number lookup). Bar chart plotted via `matplotlib`. No spaCy/ML involved — pure data parsing with `pandas`.
  
- [Translators Amalgamated Greek NT (TAGNT) Parser](./TANTT.ipynb): Transforms the raw Tyndale Amalgamated Greek New Testament (TAGNT) data files into a clean, searchable table. Anyone can look up a verse like John 1:1 and instantly see each Greek word alongside its root form, Strong’s number, and a plain-English grammatical label.
  *Technical:* File parsing and DataFrame construction with `pandas`. Morphological codes expanded via dictionary lookup against STEPBible TAGNT/TBESG files. No ML/NLP model used.

- [Analyse des citations et échos de Deutéronome 6-8 dans Matthieu 4](./Mt4_Deut6_8_Analysis.ipynb): Investigates the literary relationship between Deuteronomy 6–8 (Greek Septuagint) and Matthew 4 — the temptation narrative. The notebook detects exact quotations, thematic echoes, and vocabulary overlap, making visible the intertextual fabric that a Greek reader would have recognized.
  *Technical:* Three-method intertextual analysis: (1) exact n-gram matching for citations, (2) keyword density analysis, (3) cosine similarity on transformer embeddings for semantic overlap. Powered by `spaCy` + `grc_odycy_joint_trf`. Custom Greek stopword list; results presented via `pandas` DataFrames.

- [Mark on spaCy](./test.ipynb): A minimal working example showing how to load Ancient Greek text and extract basic linguistic information — tokens, lemmas, and parts of speech. A good starting point before diving into the more specialized notebooks.
  *Technical:* Basic tokenization, lemmatization, and POS tagging via `spaCy` + `grc_odycy_joint_trf` on GPU (Apple MPS). Verifies model setup and hardware availability.

## Step Data

Inside the STEPBible-Data clone, you find specific files for NT work:

TANTT (Tyndale Amalgamated NT Tagged Texts): The "gold mine" for NT study. It contains the Greek text of the New Testament with every word tagged for its lemma (root form), Strong’s number, and morphological code.

TBESG (Tyndale Brief Lexicon of Extended Strongs for Greek): A Greek-English lexicon based on corrected Abbott-Smith data. It maps Strong’s numbers to concise English definitions.

TIPNR (Tyndale Individualised Proper Names): Excellent for tracking specific people and places across the NT, distinguishing between different "Marys" or "Johns."

TVTMS (Tyndale Versification Traditions): Useful if you need to align different Bible versions (e.g., KJV vs. Nestle-Aland) where verse numbering differs.

## Prerequisites

Due to strict dependency requirements for the OdyCy model, it is recommended to use **Python 3.12** or **Python 3.10**, as newer versions (like 3.14) lack pre-compiled `spaCy` binaries. 

## Setup

1. **Install the environment and dependencies using Make:**

```bash
make install
```

2. **Activate the virtual environment:**

```bash
source .venv/bin/activate
```

## Verifying Setup

Run the `test.py` script included in the repository to ensure your Apple Silicon GPU (MPS) is available and the Ancient Greek model loads correctly:

```bash
python test.py
```

## Notes

The ancient Greek in STEPBible is normalized. If you are comparing it against other texts (like SBLGNT), ensure you use unicodedata.normalize('NFC', text) to match characters correctly.

## See also

https://github.com/jcuenod/awesome-bible-data
