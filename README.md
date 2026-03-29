# Installation Instructions

This project uses `spaCy` and the OdyCy Transformer model for Ancient Greek, optimized for Apple Silicon (MPS).

## Project Notebooks

This repository includes several Jupyter notebooks designed to demonstrate and analyze Ancient Greek texts using different approaches:

- [TANTT.ipynb](./TANTT.ipynb): Demonstrates how to load, parse, and explore the **Translators Amalgamated Greek NT (TAGNT)** dataset. It takes raw text files containing the entire New Testament and converts them into a clean, searchable table (DataFrame) with user-friendly labels (Bible Reference, Greek Text, Lemma, Strong's Number, and full explicit Grammar/Morphology descriptions). Perfect for non-specialists wanting to search specific verses like John 1:1.

- [Mt4_Deut6_8_Analysis.ipynb](./Mt4_Deut6_8_Analysis.ipynb): An advanced NLP analysis notebook. It uses the `odyCy` transformer model to identify and analyze intertextual relationships (explicit quotes, allusions, keyword echoes) between the Greek Septuagint (LXX) version of Deuteronomy 6-8 and the Gospel of Matthew 4. 

- [John_Person_Names_Frequency.ipynb](./John_Person_Names_Frequency.ipynb): Generates a frequency list of person names in the Gospel of John, sorted by how often they appear using the `odyCy` model.

- [Mark_Person_Names_Frequency.ipynb](./Mark_Person_Names_Frequency.ipynb): Uses the `grc_odycy_joint_trf` model to count the frequency of proper nouns in the Gospel of Mark.

- [Mark_Places_Names-Geoloc.ipynb](./Mark_Places_Names-Geoloc.ipynb): Extracts proper nouns in the Gospel of Mark using the `grc_odycy_joint_trf` model, then cross-references them with the `STEPBible-Data` places dataset to identify geographical locations and extract their coordinates, mapping these ancient locations using `folium`.

- [test.ipynb](./test.ipynb): A basic testing and demonstration notebook showing how to set up and process Ancient Greek text (like the Gospel of Mark) using the `spaCy` framework and the `odyCy` transformer model.

## Step Data

Inside the STEPBible-Data clone, you find specific files for NT work:

TANTT (Tyndale Amalgamated NT Tagged Texts): The "gold mine" for NT study. It contains the Greek text of the New Testament with every word tagged for its lemma (root form), Strong’s number, and morphological code.

TBESG (Tyndale Brief Lexicon of Extended Strongs for Greek): A Greek-English lexicon based on corrected Abbott-Smith data. It maps Strong’s numbers to concise English definitions.

TIPNR (Tyndale Individualised Proper Names): Excellent for tracking specific people and places across the NT, distinguishing between different "Marys" or "Johns."

TVTMS (Tyndale Versification Traditions): Useful if you need to align different Bible versions (e.g., KJV vs. Nestle-Aland) where verse numbering differs.

## Prerequisites

Due to strict dependency requirements for the OdyCy model, it is recommended to use **Python 3.12** or **Python 3.10**, as newer versions (like 3.14) lack pre-compiled `spaCy` binaries. 

## Setup

1. **Delete any existing broken environments (if applicable):**

```bash
rm -rf .venv
python3.12 -m venv .venv
source .venv/bin/activate
pip install -U pip setuptools wheel -r requirements.txt
curl -L -o grc_odycy_joint_trf-0.7.0-py3-none-any.whl "https://huggingface.co/chcaa/grc_odycy_joint_trf/resolve/main/grc_odycy_joint_trf-0.7.0-py3-none-any.whl"
pip install ./grc_odycy_joint_trf-0.7.0-py3-none-any.whl
rm grc_odycy_joint_trf-0.7.0-py3-none-any.whl
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
