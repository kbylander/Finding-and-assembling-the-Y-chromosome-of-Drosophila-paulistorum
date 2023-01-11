# Finding and assembling the Y chromosome of _Drosophila paulistorum

This project is part of the course Applied Bioinformatics, 1MB519, at Uppsala University.

Members of the project are: \
[Ellen Siggstedt](https://github.com/ESiggstedt) \
[Jay Håkansson](https://github.com/Jay-uu) \
[Karl Bylander](https://github.com/kbylander)

We got data and full genome assemblies from [here](https://github.com/mmontonerin/ComparativeGenomics_Dpaulistorum/tree/main/00_Assembly) \
Note: Currently (2022-12-20) not all data is publicly available.

11/1-2023

**Project client:** Mercè Montoliu Nerín, Lisa Klasson

**Supervisor:** Douglas Scofield

**Course:** Applied Bioinformatics

## Abstract

The fly species _Drosophila paulistorum_ is divided into six semi-species because it is currently undergoing speciation, which makes it a prime candidate for studying patterns of evolution with regards to mating systems. In order to investigate the impact on gene expression, fitness and fertility in males, a well assembled Y chromosome is necessary. Because of its unique structure, relative to the other chromosomes, it is more difficult to sequence and current assembly methods rarely result in an assembled Y chromosome.

We have created a method that uses differential coverage of mixed sexes and female read samples on a reference genome to produce a _de novo_ Y chromosome assembly. By identifying regions likely belonging to the Y chromosome and then re-mapping and re-assembling the given reads specifically, a Y chromosome more contiguous and better aligned to sibling species _D. willistoni_ Y chromosome was produced.

## ![](RackMultipart20230111-1-ytmjru_html_29a732ce4764222.png)Popular science summary

_Drosophila paulistorum_ is a fly species related to the common fruit fly, _D. melanogaster_,that we find on fruit in our homes. _D. paulistorum_ lives in South America and is of special interest because it is currently undergoing the process of becoming several separate species. Interesting patterns on the Y chromosome in other Drosophila species have been observed and _D. paulistorum_ might have a larger Y chromosome than X chromosome - which is quite unusual. However, few attempts to put together its Y chromsome and identify its genes have been made. The Y chromosome could hold the secrets to this unusual size, how species are formed, which genes are responsible for certain traits, and more. By making use of the new technologies, and selecting potential Y chromosome parts before putting the genome together, we have assembled _Drosophila__paulistorum's_ Y chromosome for the first time.

The genome, all of an organism's DNA, holds the answer to the organism's appearance, functions and evolutionary history. With recent leaps in technology accessing the genome sequence has become easier and easier, but there are still many challenges to overcome. The technologies that read the DNA sequences from a sample can not read everything in one go. The genome has to be divided into parts and then put together again. This is where assemblers come in; software developed specifically for taking the resulting DNA-pieces and glueing them together in the correct order to finally have a representation of the genome. The assembly programs use various signs in the DNA and many algorithms to be able to tell which pieces belong together in a relatively quick way.

All of these steps result in errors between the reconstructed genome and the actual genome in the organism. Variations lead to some parts being easier to handle and some parts a lot harder, this is especially the case in the ends and the middle of the chromosomes. The more difficult areas are regions in the genetic sequence where the same patterns repeat multiple times and there are multiple copies of genes, and in the chromosomes certain areas where the DNA is tightly packed and harder to separate.

However, the emergence of new technologies has given the possibility of uncovering the secrets of these difficult regions, and overcoming these problems for both the sequencing technology and assembly software is finally on the horizon. Therefore, the Y chromosome can be investigated to a greater extent due to the possibility to read longer stretches of DNA, which means larger and fewer parts to try and puzzle together. But still the Y chromosome is very rarely put together by the current assembly software. As a consequence of this, the role of the Y chromosome is nevertheless to a large degree unknown in most species. With our adapted method, perhaps this can finally change.

By doing comparisons to related _Drosophila_ species one can validate if the Y chromosome is actually in the assembled genome, or if it even was in the genome from the beginning. This can be both by searching for Y-specific genes previously found in other _Drosophila_ species, as well as comparing the whole genomes towards each other to find similar regions already determined as Y-regions. By utilising the new technologies and evaluation methods the opportunity to come closer towards the complete Y chromosome has opened up. After this project we are one step closer towards answering questions about the Y chromosome of _D. paulistorum_ itself, but also how speciation of this species works!

## Table of contents

**[Abstract](#_r8v1hfrjl21v) 2**

**[Popular science summary](#_ru6r0lidr6d0) 3**

**[Table of contents](#_bscty4fxm2sq) 5**

**[Abbreviations](#_x811k3pggdl) 7**

**[1 Introduction](#_iu4c6af25jfe) 8**

**[2 Background](#_c2arl5qffpuj) 8**

[2.1 Sex determination and sex chromosome evolution](#_6x84eomd8gnc) 8

[2.2 The Y chromosome is a challenge to study](#_1kvkzqu0zdys) 8

[2.3 The Drosophila paulistorum semi-species](#_z08v5uj64nyj) 9

[2.4 Unique Y chromosome qualities in Drosophila](#_lwn8k5au5fsa) 9

[2.5 Y chromosome in other Drosophila species](#_xs9iat3qbo3z) 10

[2.6 Purpose](#_das60epg00nu) 10

**[3 Materials and methods](#_gec1ziawptor) 11**

[3.1 Data](#_i7x5f50teij) 11

[3.2 Evaluating the O11 assemblies](#_a79rbms9qe3o) 12

[3.2.1 Sequence homology and synteny](#_pjjp6qiya7o) 12

[3.2.2 Evaluating presence of known Y-linked genes](#_drvaxy4fjoz8) 13

[Using BLAST on Y-linked genes](#_8nobjahmaub3) 13

[Using BLAST on Y-specific genes](#_mjswg1esmmk9) 14

[3.2.3 Read mapping and differential coverage analysis (DCA)](#_t1bu6oz8f98c) 14

[3.2.4 Putative Y-contig extraction](#_hvg5d17dqop2) 14

[3.3 Assembling the Y chromosome](#_jbi3bdy9y074) 14

[3.3.1 Extract putative Y chromosome reads](#_dpotv3j5udlz) 15

[3.3.2 Flye assembly of extracted reads](#_jrgynri953hw) 15

[3.3.3 Alignment of NDN-FLYE-DCA and CANU-FLYE-DCA](#_g81m26lr6jfa) 16

[3.3.4 Transcriptomic evaluation of flye assembly](#_6idfi1rhqcep) 16

**[4 Results](#_fss95p8igr5a) 16**

[4.1 Evaluation of the provided assemblies](#_wnnvv6oyuzp2) 16

[4.1.1 NDN-Full and CANU-Full genome alignments](#_q5hfvwosxpxv) 16

[4.1.2 Differential coverage analysis](#_rdzhg42qmeaa) 18

[4.2 Assembling the Y chromosome](#_h5xbf3vrazuk) 19

[4.3 Evaluation of NDN-FLYE-DCA and CANU-FLYE-DCA](#_6x9gbihm3hjr) 21

[4.3.1 RNA expression analysis](#_21j97gh5kqkl) 23

[4.4 Presence of known Y-linked genes](#_niyrli9ovfl) 23

[4.5 Summary of results](#_bzpxuih2o7j8) 24

**[5 Discussion](#_ed1cpxcyhr6z) 25**

[5.1 The presence of the Y chromosome in the provided assemblies](#_7tp3dh3cmplu) 25

[5.2 Is reassembling contigs from Differential Coverage Analysis worth it?](#_n1mgvadwnjqh) 26

[5.3 Additional read extractions results in large Y assemblies](#_hek829jv1f1h) 27

[5.4 Presence of Y-specific genes and Y-linked genes](#_7s6y3ravglmq) 27

[5.5 Can transcriptomics aid in the evaluation of the assemblies?](#_yub11d47kjkr) 28

**[6 Conclusion](#_204jv2xzidah) 28**

**[7 Group member contributions](#_nqf0mp6lbwbx) 29**

**[8 Acknowledgement](#_r7ap0ehewwef) 29**

**[9 References](#_hrvukhm03227) 29**

**[10 Appendix](#_7dlcwkbt08g9) 31**

[10.1 Genes and result for evaluating presence of known Y-linked genes](#_kshepz3tna) 31

##


## Abbreviations

| bp | Base pair |
| --- | --- |
| CANU-FLYE-DCA | Flye assembly, reads extracted from DCA on CANU-Full |
| CANU-Full | Canu O11 provided full assembly |
| CANU-PY | Canu putative Y |
| DCA | Differential coverage analysis |
| GF | Gene fishing |
| Gb, Mb, kb | Giga bases, Mega bases, Kilo bases |
| mixed | Sample containing both male and female |
| NDN-FLYE-DCA | Flye assembly, reads extracted from DCA on NDN-Full |
| NDN-Full | NextDenovo O11 provided full assembly |
| NDN-PY | NextDenovo putative Y |
| OR | Orinocan (a semi-species of _Drosophila paulistorum)_ |


## **1 Introduction**

_Drosophila paulistorum_ is divided into six semi-species which appear to be undergoing incipient speciation [(Dobzhansky & Spassky 1959)](https://www.zotero.org/google-docs/?lqrow1). One of those semi-species is Orinocan (OR) which is the focus of this project. Our aim with this project is to contribute towardsdiscoveringwhether the Y chromosome of _D. paulistorum_ is involved in speciation. In _Drosophila_ the Y chromosome is not involved in sex determination, unlike the case for mammals. Instead, the sex is determined by the dosage of the X chromosome [(Salz & Erickson 2010)](https://www.zotero.org/google-docs/?1RwtV5). The Y chromosome of Drosophila is heterochromatin-rich, which presents challenges for sequencing and assembly [(Ricchio](https://www.zotero.org/google-docs/?oYFg9A)[_et al._](https://www.zotero.org/google-docs/?oYFg9A)[2021)](https://www.zotero.org/google-docs/?oYFg9A). If one could overcome such problems, questions about how the Y chromosome impacts gene expression, fitness and fertility in males might be answered [(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?W1VV85). Because of repetitive regions, the structures of Y chromosomes can diverge between closely related species. An interesting finding is that in contrast to many other _Drosophila_ species, _D. paulistorum_ has a larger male genome than female genome, which appears to be largely due to the size of the Y chromosome [(Hjelmen](https://www.zotero.org/google-docs/?n7B8kw)[_et al._](https://www.zotero.org/google-docs/?n7B8kw)[2019a)](https://www.zotero.org/google-docs/?n7B8kw). The goals of this project are (1) to evaluate if the Y chromosome is already assembled in two different OR assemblies from the O11 strain; (2) assemble the Y chromosome if it is not already complete; (3) evaluate how well the Y chromosome has been assembled.

## **2 Background**

## 2.1 Sex determination and sex chromosome evolution

The canonical theory for the evolution of the XY system states that the differentiation of the sex chromosomes stems from inversions on the Y chromosome which limits recombination between the X and Y sex chromosomes [(Hjelmen](https://www.zotero.org/google-docs/?6jlvQv)[_et al._](https://www.zotero.org/google-docs/?6jlvQv)[2019b, Furman](https://www.zotero.org/google-docs/?6jlvQv)[_et al._](https://www.zotero.org/google-docs/?6jlvQv)[2020)](https://www.zotero.org/google-docs/?6jlvQv). This may start a Muller's ratchet process, i.e. accumulation of deleterious mutations accompanied by loss of less-mutated chromosomes, and thus, the degeneration of the Y chromosome [(Lenormand & Roze 2022)](https://www.zotero.org/google-docs/?zheUKL). If the inversion is reversed, sex-specific regulators will induce a sex-antagonistic effect. This appears to be the predominant mechanism, despite non-model organisms showing alternate evolutionary paths [(Furman](https://www.zotero.org/google-docs/?P3pOzu)[_et al._](https://www.zotero.org/google-docs/?P3pOzu)[2020)](https://www.zotero.org/google-docs/?P3pOzu).

In mammals, sex is determined by the presence of the Sex-determining Region Y (_SRY_) gene on the Y chromosome [(Hughes & Rozen 2012)](https://www.zotero.org/google-docs/?gE7EnQ). In the _Drosophila_ genus, however, the Y chromosome lacks a sex-determining gene and is not involved in sex determination. Instead, sex is determined by X chromosome dosage, where both X0 and XY results in males and XX results in females [(Salz & Erickson 2010)](https://www.zotero.org/google-docs/?Ie8fH9).

## 2.2 The Y chromosome is a challenge to study

Despite not being involved in sex determination, the Y chromosome affects gene expression, fitness and fertility in male _Drosophila_[(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?LpCMn0). Knowing the structure of the Y chromosome is necessary to unveil the underlying mechanism, but its unique structure makes this particularly challenging, due to heterochromatin and repeat-rich regions. Heterochromatin makes up the telomeres and centromeres on all chromosomes and the Y chromosome is particularly heterochromatic. This means that a majority of the DNA in the Y chromosome is densely packed and often, heterochromatin is also repeat-rich [(Marsano](https://www.zotero.org/google-docs/?pUanRH)[_et al._](https://www.zotero.org/google-docs/?pUanRH)[2019)](https://www.zotero.org/google-docs/?pUanRH). These regions are significantly more difficult to sequence and assemble, which limited research in the structure of the Y chromosome [(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?2DznGA). A more tailored approach is required to study these chromosomes further [(Ricchio](https://www.zotero.org/google-docs/?ytmk3U)[_et al._](https://www.zotero.org/google-docs/?ytmk3U)[2021)](https://www.zotero.org/google-docs/?ytmk3U).

## 2.3 The _Drosophila paulistorum_ semi-species

The species of interest in this study is _Drosophila paulistorum_ which is a member of the _Drosophila willistoni_ species group [(Zanini](https://www.zotero.org/google-docs/?xa2TqB)[_et al._](https://www.zotero.org/google-docs/?xa2TqB)[2015)](https://www.zotero.org/google-docs/?xa2TqB)_. D. paulistorum_ consists of six semi-species which, depending on what mating configurations are used, result in viable hybrids or no offspring at all. These hybridisation variations are a sign that these semi-species are currently undergoing speciation [(Dobzhansky & Spassky 1959)](https://www.zotero.org/google-docs/?tEAm3W). The semi-species are Amazonian (AM), Andean Brazilian (AB), Centro-American (CA), Interior (IN), Orinocan (OR) and Transitional (TR) [(Baião](https://www.zotero.org/google-docs/?FhxBBa)[_et al._](https://www.zotero.org/google-docs/?FhxBBa)[2019)](https://www.zotero.org/google-docs/?FhxBBa). Outgroups in this project are _D. willistoni_ and _D. melanogaster,_ where _D. melanogaster_ is more distantly related [(Massey & Wittkopp 2016, Zanini](https://www.zotero.org/google-docs/?ya668r)[_et al._](https://www.zotero.org/google-docs/?ya668r)[2018)](https://www.zotero.org/google-docs/?ya668r). All species mentioned can be seen in Figure 1.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image1.png)
_Figure 1. The taxonomic relationships between D. paulistorum, D. willistoni and D. melanogaster. AM is Amazonian, AB is Andean Brazilian, CA is Centro-American, IN is Interior, OR is Orinocan and TR is Transitional. Phylogenetic relationships are taken from_ [_Robe_](https://www.zotero.org/google-docs/?xKxFIB)[_et al._](https://www.zotero.org/google-docs/?xKxFIB)[_(2010_](https://www.zotero.org/google-docs/?xKxFIB)[_) and_](https://www.zotero.org/google-docs/?xKxFIB)[_Finet_](https://www.zotero.org/google-docs/?xKxFIB)[_et al._](https://www.zotero.org/google-docs/?xKxFIB)[_(2021)_](https://www.zotero.org/google-docs/?xKxFIB)_._

## 2.4 Unique Y chromosome qualities in _Drosophila_

Contrary to many cases in the _Drosophila_ genus, _D. paulistorum_ displays a larger male than female genome [(Hjelmen](https://www.zotero.org/google-docs/?4AisII)[_et al._](https://www.zotero.org/google-docs/?4AisII)[2019a)](https://www.zotero.org/google-docs/?4AisII) and _Drosophila_ has a 10 fold higher gene gain than loss on the Y chromosome [(Ricchio](https://www.zotero.org/google-docs/?I1LGp5)[_et al._](https://www.zotero.org/google-docs/?I1LGp5)[2021)](https://www.zotero.org/google-docs/?I1LGp5). In _D. willistoni_, a sibling species to _D. paulistorum_, the gene gain seems to be connected to a speciation event [(Ricchio](https://www.zotero.org/google-docs/?Glpx2I)[_et al._](https://www.zotero.org/google-docs/?Glpx2I)[2021)](https://www.zotero.org/google-docs/?Glpx2I). Evidence points to ~25% of the new genes in _Drosophila_ stemming from retro-transpositions and the rest from duplications after the recombination arrest as an early step in the process of evolving a new Y system [(Hjelmen](https://www.zotero.org/google-docs/?lQe60h)[_et al._](https://www.zotero.org/google-docs/?lQe60h)[2019a, Ricchio](https://www.zotero.org/google-docs/?lQe60h)[_et al._](https://www.zotero.org/google-docs/?lQe60h)[2021)](https://www.zotero.org/google-docs/?lQe60h). The Y chromosome is then degenerated later in the process due to the accumulation of deleterious mutations.

## 2.5 Y chromosome in other _Drosophila_ species

A Y chromosome analysis of _D. willistoni_ [(Ricchio](https://www.zotero.org/google-docs/?wx8F3K)[_et al._](https://www.zotero.org/google-docs/?wx8F3K)[2021)](https://www.zotero.org/google-docs/?wx8F3K) found 22 Y-linked genes. Eight of these were previously found in Y chromosomes of _D. melanogaster_ and _D. virilis_. The rest were novel gene duplications from X-linked or autosomal genes. Additionally, the analysisfound 45 pseudogenes in the Y chromosome, which also seems to originate from either X-linked or autosomal chromosome regions through large segmental duplications. Four of the eight new genes arose via this mechanism.

In another species _D. melanogaster_, studies find 15 Y-linked genes and 13 duplications from other chromosomes to the Y chromosome, where most of the duplications are located in the area surrounding the centromere, called the pericentromere [(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?6XJ2g7). The properties of the heterochromatin on the Y chromosome vary [(Wang](https://www.zotero.org/google-docs/?wwva0M)[_et al._](https://www.zotero.org/google-docs/?wwva0M)[2014)](https://www.zotero.org/google-docs/?wwva0M) and it is suggested that the pericentromere is more accessible than other parts of the chromosome and is therefore prone to duplications and transcription [(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?vCZYCc). The seven genes _kl-2_, _kl-3_, _ORY_, _PRY_, _ARY_, _PPrY_ and _CCY_ are possibly Y-specific in both _D. melanogaster_ and _D. willistoni_ [(Ricchio](https://www.zotero.org/google-docs/?9iBFJT)[_et al._](https://www.zotero.org/google-docs/?9iBFJT)[2021)](https://www.zotero.org/google-docs/?9iBFJT).

## 2.6 Purpose

The main goal of this project is to create a pipeline to extract and assemble the Y chromosome in _Drosophila paulistorum_. The first goal is to find out if the Y chromosome already has been assembled in two assemblies, produced with different methods, of the semi-species OR. The second goal is to extract the potential Y chromosome reads and assemble them. The third and last goal is to evaluate how well the Y chromosome has been assembled. The long term goal is for our work to provide a foundation to investigate whether the Y chromosome is involved in speciation in _D. paulistorum_.

To achieve the project goals we addressed the following questions:

- Which previously known Y-linked genes in closely related _Drosophila_ species can we find in the provided _D. paulistorum_ O11 genome assemblies?

- Is it possible to infer the known Y-linked genes' locations on putative Y chromosome contigs?

- Can putative Y-linked reads of _D. paulistorum_ O11 be extracted and if so, can the reads be used to perform an assembly of the Y chromosome?

- Can the Y chromosome reads be identified by doing a differential coverage analysis with short reads? Would this intersection result in a reasonably complete Y chromosome without too much contamination?

Considering the well-known difficulty of assembling repeat-rich regions, it was our suspicion that additional steps were required for a _de novo_ assembly to contain an assembled Y chromosome. We hypothesised that differential read coverage analysis can reliably select for Y-linked reads that can then be assembled separately to get an assembled Y chromosome.

## **3 Materials and methods**

Figure 2 is an overview of the workflow in this project. The blue section describes the different methods used to evaluate whether the Y chromosome is already well assembled in the provided assemblies. The green part describes what to do if it appears to be well assembled, while the purple part describes what to do in the opposite case. To be considered well assembled, one should expect Y-linked genes in the assembly and a whole genome alignment indicates that the Y chromosome is complete to some extent. The pink section describes the pipeline used for such a case when the Y chromosome is not complete, this includes extraction of putative Y-contigs, assemblies as well as several methods for evaluation of the assemblies.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image10.png)
_Figure 2. An overview of the workflow for the project. The project is divided into evaluating the provided assemblies for Y chromosome content and making_ de novo _assemblies using putative Y Nanopore reads._

## 3.1 Data

Our client provided two assemblies made from Nanopore reads and polished by Illumina reads, from both sexes, of the O11 strain from the OR semi-species of _D. paulistorum._ One was made using NextDenovo [(NextOmics](https://www.zotero.org/google-docs/?iCsFkI)[,](https://www.zotero.org/google-docs/?iCsFkI)[2019)](https://www.zotero.org/google-docs/?iCsFkI), which we name NDN-Full, using downsampled reads with coverage of 50X, correction options "read\_cutoff = 1k, genome\_size = 250m, sort\_options = -m 7g -t 2, minimap2\_options\_raw = -t 3, pa\_correction = 17, correction\_options = -p 2" and assemble options "minimap2\_options\_cns = -t 3, nextgraph\_options = -a 1". This assembly was polished with both long- and short reads. The other one was made using Canu/2.1.1 [(Koren](https://www.zotero.org/google-docs/?nQsPEB)[_et al._](https://www.zotero.org/google-docs/?nQsPEB)[2017)](https://www.zotero.org/google-docs/?nQsPEB) which we name CANU-Full, with parameters "-d O11\_Canu\_assembly -p O11 genomeSize=250m -nanopore O11\_pass\_concat.fastq" using reads with a Q-score of at least 7 and no polishing. CANU-Full was provided much later than NDN-Full, which is why not all steps have been done on both assemblies.

DNA sequencing reads from 10 different samples, 9 of which used Illumina sequencing and one which used Nanopore sequencing were also provided. Four of the Illumina samples were from females only, one was unfertilized (which means there is no Y chromosome present), and the rest were from fertilised embryos with unknown sexes. The fertilised embryo samples were assumed to have both male and female material and are hereafter referred to as mixed samples. The reads from the unfertilized sample were of low quality, and were excluded. Additionally, RNA wild type abdomen (which also includes testes) sequencing data for both male and female was provided. An assembly of _D. melanogaster_ Y chromosome is provided [(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?msCuJw) and an assembly of _D. willistoni_ (NCBI: GCF\_018902025) [(Ricchio](https://www.zotero.org/google-docs/?nrsR2W)[_et al._](https://www.zotero.org/google-docs/?nrsR2W)[2021)](https://www.zotero.org/google-docs/?nrsR2W) were also provided. Reads and assemblies for other semi-species/related species, were available but not used for this project. A fasta file with coding regions of seven Y-specific genes named Ygenes\_Dwil\_also\_in\_Dmel.fasta was also provided. All our scripts and supplementary files can be found at our GitHub repository ([https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum)) or are linked to google drive document in 10.1. Since our clients' assemblies and read data have not yet been published, we provide only statistics and contig names in this report.

## 3.2 Evaluating the O11 assemblies

The evaluation of the O11 assemblies provided by the client consists of several analysis methods with the aim to investigate whether the Y chromosome is already assembled and to what extent.

### 3.2.1 Sequence homology and synteny

As an initial step of the evaluation, a genome alignment using MUMmer/4.0.0rc1 nucmer tool [(Marçais](https://www.zotero.org/google-docs/?broken=6aNdnT)[_et al._](https://www.zotero.org/google-docs/?broken=6aNdnT)[2018)](https://www.zotero.org/google-docs/?broken=6aNdnT) was performed against _D. melanogaster_[(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?YKq5bU) with NDN-Full. The alignments were visualised using Integrative Genomics Viewer (IGV/2.8.13) [(Robinson](https://www.zotero.org/google-docs/?92Ir8n)[_et al._](https://www.zotero.org/google-docs/?92Ir8n)[2011)](https://www.zotero.org/google-docs/?92Ir8n) by first filtering out low quality alignments with delta-filter. Then to produce a coordinate file, the show-coords tool was used with the settings T: tab delimited format, r: sort by reference and H: remove header. To make it compatible, a .bed file was acquired by extracting columns 8: name of the reference contig, 1: start position, 2: end position, 9: name of the query contig, 7: match quality. See scripts mummer\_O11\_melanogaster and mummer\_O11\_willistoni.

To acquire the unlocalised scaffolds of _D. willistoni_, the extracting\_Y\_scaffolds.py script was used, applying the D. willistoni fasta and a .txt file of all scaffolds without an assigned molecule created using the assembly report ([https://www.ncbi.nlm.nih.gov/data-hub/genome/GCF\_018902025.1/](https://www.ncbi.nlm.nih.gov/data-hub/genome/GCF_018902025.1/)). The RefSeq accessions of these were used to filter out the unwanted scaffolds of the D. willistoni genome. The resulting fastas were aligned against Canu-Full and NDN-Full applying similar mummerscripts as previously mentioned (mummer\_NDN-Full\_will\_Y,mummer\_CANU-Full\_will\_Y).

### 3.2.2 Evaluating presence of known Y-linked genes

To further examine if the Y chromosome is already assembled in NDN-Full and CANU-Full, a number of Y-linked genes that were previously found in _D. willistoni_ [(Ricchio](https://www.zotero.org/google-docs/?ZArKgq)[_et al._](https://www.zotero.org/google-docs/?ZArKgq)[2021)](https://www.zotero.org/google-docs/?ZArKgq) were searched for in the two assemblies. These genes are mentioned in Section 2.5 and consist of 14 novel findings of Y-linked genes in _D. willistoni_ (with orthologs in _D. melanogaster_), which are by Ricchio _et al._ (2021) both expected (10 genes) and not expected (4 genes) to be found in _D. paulistorum_. There is also one gene not expected in _D. melanogaster,_ but in both _D. paulistorum_ and _D. willistoni_. Another group, of seven genes, have previously been found in _D. melanogaster_ and _D. willistoni_ and are also considered to be Y-specific to some extent. Sequences for the genes previously found in _D. melanogaster_ were collected from supplementary material of Ricchio _et al._ (2021). The nucleotide sequence for each of the remaining genes, in the Y chromosome of _D. melanogaster_, were downloaded in fasta format from NCBI [(Sayers](https://www.zotero.org/google-docs/?264JbW)[_et al._](https://www.zotero.org/google-docs/?264JbW)[2022)](https://www.zotero.org/google-docs/?264JbW). All genes were merged into one single fasta file named genes.fasta. An additional file with only the coding regions of Y-specific genes was created separately as Ygenes\_Dwil\_also\_in\_Dmel.fasta.

#### Using BLAST on Y-linked genes

To gain insight whether these genes are in NDN-Full and CANU-Full or not, BLAST/2.12.0+ [(Camacho](https://www.zotero.org/google-docs/?5zlWgq)[_et al._](https://www.zotero.org/google-docs/?5zlWgq)[2009)](https://www.zotero.org/google-docs/?5zlWgq) was used to find matches in the two assemblies separately. A BLAST database was created using the assembly and nucleic acid sequence as database type, which was then BLAST:ed as the subject with the list of genes genes.fasta as the query using the BLAST function tblastx to convert the sequences to protein. Another BLAST was run using the function blastn instead which uses the nucleotides without conversion to protein. The results from BLAST were then parsed using the python script gene\_fishing\_table.py which filters on alignment lengths longer than 60% of the gene length for the specific gene. For the result from tblastx, the filtering was one third of 60% since the sequences are also converted to proteins which reduces the length. Using the shorter list of genes which are considered as Y-specific, the BLAST method blastn were used in a similar way. The commands used for this can be seen in gene\_fishing.sh and gene\_fishing\_wil+mel.sh.

#### Using BLAST on Y-specific genes

Y-specific genes, genes that previously have only been found on the Y chromosome in related species, are easier to distinguish as true Y chromosomal hits since they are unlikely to be found in autosomal- and X-alignments. The client provided a file called Ygenes\_Dwil\_also\_in\_Dmel.fasta with the coding sequences for seven Y-specific genes from _D. willistoni_, previously found in both _D. melanogaster_ and _D. willstoni_, which were searched for in both NDN-Full and CANU-Full using the same BLAST method as described above.

### 3.2.3 Read mapping and differential coverage analysis (DCA)

Index files for read mapping were created for Nanopore long reads and Illumina short reads with minimap2/2.24-r1122 [(Li 2018 s. 2)](https://www.zotero.org/google-docs/?XN7Ea9). The indexes were then used for mapping reads of one Nanopore DNA sample, four female only Illumina DNA samples and four mixed sexes Illumina samples toward NDN-Full and CANU-Full separately. The read mapping was done using the presets for respective sequencing types in minimap2 (-ax sr for Illumina and -ax map-ont for Nanopore). Each sample was mapped individually. We used samtools/1.14 [(Danecek](https://www.zotero.org/google-docs/?0gM8iX)[_et al._](https://www.zotero.org/google-docs/?0gM8iX)[2021)](https://www.zotero.org/google-docs/?0gM8iX) on the resulting files to convert them to bam format, sort them, and analyse read depth at each base (-aa -Q 10).

For the samples sequenced with Illumina, the depth output was normalised; for each column, dividing each base with the squared median (norm\_by\_column.py, then combined to one file in the same order as before) before combining the read depth at each base for the female samples into one average and one average for the mixed samples (combine\_samples\_by\_average.py). The resulting average depth for each base was then analysed in 10-kilobase (kb) regions, for bases where the sum of female and mixed read depth was more than 1, meaning that if both female and mixed had very low read depth that position was not counted. The aim with this was to estimate the average and median ratio of depth between female/mixed (frame\_depth\_new.pl by [Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?0eMpcP). An additional depth analysis was done on CANU-Full using all bases where the mixed sample average was more than zero (frame\_depth\_filt\_mix\_0.pl). Contigs with mean female-to-mixed coverage ratio of zero and mixed coverage depth of more than zero were then extracted as putative Y-linked contigs (putative\_contigs.py) from all depth analyses.

### 3.2.4 Putative Y-contig extraction

The putative Y contigs of NextDenovo (NDN-PY), Canu (CANU-PY) and _D. willistoni_ were extracted using the extract\_y\_contigs.py script. For NDN-PY and CANU-PY, the resulting contig list after the differential coverage analysis were used to create the putative Y-contig fastas.

## 3.3 Assembling the Y chromosome

### 3.3.1 Extract putative Y chromosome reads

In order to assemble the Y chromosome the putative Y chromosome reads need to be extracted. This is achieved by using mixed sexes Nanopore reads mapped towards the assemblies, and extracting those reads mapping to the putative Y-linked contigs from Section 3.2.3. This was done separately based on which assembly had been used in the DCA, NDN-Full or CANU-Full. The samtools view function (samtools/1.14, [Danecek](https://www.zotero.org/google-docs/?R2iglu)[_et al._](https://www.zotero.org/google-docs/?R2iglu)[2021)](https://www.zotero.org/google-docs/?R2iglu) was used with a flag to output primary alignments, from the sorted alignment between mixed Nanopore reads and the corresponding O11 assembly, that match the specified file with structure of a bed file with putative Y-contigs (putative\_contigs.csv). The result is also specified to be in bam format, which is converted to fasta format using samtools fasta. The command in its entirety is in extract\_putative\_Y\_nanopore.sh. Total length of the extracted reads, N50, the longest fragment and number of reads extracted was calculated with assembly\_stats.py ([https://github.com/MikeTrizna/assembly\_stats/blob/master/assembly\_stats/assembly\_stats.py](https://github.com/MikeTrizna/assembly_stats/blob/master/assembly_stats/assembly_stats.py)).

The read depth for the concerned contigs from the first list (putative\_contigs.csv) were also extracted and average values as well as standard deviations for each contig were calculated using two python scripts (read\_depth\_extracted\_contigs.py and summarize\_read\_depth\_extracted\_contigs.py).

### 3.3.2 Flye assembly of extracted reads

Each set of extracted reads from the putative contigs from DCA (Section 3.2.3) were assembled separately using the Flye/2.9.1 [(Kolmogorov](https://www.zotero.org/google-docs/?zo0Rfa)[_et al._](https://www.zotero.org/google-docs/?zo0Rfa)[2019)](https://www.zotero.org/google-docs/?zo0Rfa)_de novo_ assembler. Data was specified as Nanopore raw reads. The complete command can be found in the script flye\_assembly\_nanopore.sh. A quick evaluation of the extracted contigs and the resulting assembly was done using assembly\_stats.py ([https://github.com/MikeTrizna/assembly\_stats/blob/master/assembly\_stats/assembly\_stats.py](https://github.com/MikeTrizna/assembly_stats/blob/master/assembly_stats/assembly_stats.py)). The same gene fishing as in Section 3.2.2 were performed for the resulting assemblies, using both the blastn and tblastx (using conversion to proteins) method for the genes.fasta and blastn for the Y-specific genes, for both the Flye assembly using reads extracted from DCA on NDN-Full (NDN-FLYE-DCA) and Flye assembly using reads extracted from DCA on CANU-Full (CANU-FLYE-DCA). This procedure of extracting reads and constructing a new assembly of putative Y-contigs followed by gene fishing were, except for NDN-Full and CANU-Full with contigs from DCA, also executed with only blastn of Y-specific genes for some other sets of putative Y contigs. The aim with this was to see if that would give a better assembly.

These cases were, for NDN-Full:

- Putative contigs from DCA + selected contigs with hits from gene fishing, with both Y-linked and Y-specific genes in NDN-Full, not already included (ctg000- 190, 330, 480, 660 and 890)
- Putative contigs from DCA (With an average ratio threshold of 0.3 instead of 0)

For CANU-Full:

- Putative contigs from DCA (With threshold set to 0 depth)
- Putative contigs from DCA (With threshold set to 0 depth) + contigs with hits from gene fishing, with Y-specific genes in CANU-Full, not already included (tig00000- 422, 659, 530 and 552)

Calculating length of contigs for the new assemblies was done via the assembly\_info\_text, while the provided assemblies contig lengths were calculated using CANU-PY and NDN-PY's sequences.

### 3.3.3 Alignment of NDN-FLYE-DCA and CANU-FLYE-DCA

Alignments and mummerplots were created between: NDN-FLYE-DCA and _D. willistoni_'s putative Y and CANU-FLYE-DCA and _D. willistoni_'s putative Y. The scripts are identical to the script in 3.2.1, only paths and minimum alignment lengths were changed.

### 3.3.4 Transcriptomic evaluation of flye assembly

To further investigate the Y presence on both NDN-FLYE-DCA and CANU-FLYE-DCA, abdomen RNA transcriptomic data from both male and females separately was mapped against the assembly using star/2.7.2b [(Dobin](https://www.zotero.org/google-docs/?BulPz7)[_et al._](https://www.zotero.org/google-docs/?BulPz7)[2013)](https://www.zotero.org/google-docs/?BulPz7). The reads were paired-end and output type was set to BAM SortedByCoordinate. For a compatible genome file, star's genomeGenerate mode was applied to the flye assembly fasta file. Since the transcriptomic data for each sex had several files, samtools merge was used to combine them into one file. The resulting bam file is then sorted using samtools sort and bedtools' genomecov extracted the coverage for each position applying the -d option, since paired-end reads were used we opted for the -pc option. This procedure was done for both the sexes separately. To visualise the results, both the male and female coverage files were normalised separately (min-max scaling) and then the difference between each datapoint of both sexes was plotted.

## 4 Results

## 4.1 Evaluation of the provided assemblies

### 4.1.1 NDN-Full and CANU-Full genome alignments

The alignments between _D. paulistorum_ O11and _D. melanogaster_'s Y-regions were scarce, as expected with a large evolutionary distance between the two species and the assembly evading properties of the Y chromosome. There were however, some large regions conserved between the species that might give an indication of the Y chromosome's presence in the _D. paulistorum_ assembly.

_Table 1: Displaying alignments between D. Paulistorum_ O11 _and the Y-linked contigs of D. melanogaster._

| _ **D. melanogaster** _ **contig** | **Alignments** |
| --- | --- |
| Y\_Contig2 | ctg000590 Y\_Contig2:960650-961132 Score = 95.48ctg000250 Y\_Contig2:1009023-1010276 Score = 94.73ctg001050 Y\_Contig2:1009023-1010276 Score = 96.04 |
| Y\_Contig35 | ctg000860 Y\_Contig35:150921-151054 Score = 96.3 |
| Y\_Contig33 | ctg000580 Y\_Contig33:123293-125703 Score = 94.31ctg000250 Y\_Contig33:128273-129335 Score = 96.53 |
| Y\_Contig122 | ctg000860 Y\_Contig122:26942-29586 Score = 96.61 |
| Y\_Contig40 | ctg000580 Y\_Contig40:2576-5224 Score = 95.81ctg000580 Y\_Contig40:2576-5224 Score = 96.19ctg000860 Y\_Contig40:2576-5224 Score = 96.12 |
| Y\_Contig48 | ctg000250 Y\_Contig48:39307-41954 Score = 96.83ctg000860 Y\_Contig48:39307-41954 Score = 96.53ctg001050 Y\_Contig48:39307-41954 Score = 94.99 |
| Y\_Contig106 | ctg000500 Y\_Contig106:11142-11615 Score = 99.37ctg000500 Y\_Contig106:50410-50876 Score = 99.36 |
| Y\_Contig44 | ctg000580 Y\_Contig44:1870-3612 Score = 97.48 |

As you can see, considering that these are the results of whole genome alignments on _D. melanogaster_'s Y-linked contigs, the alignments are short, and few.

With over 700 _D. willistoni_ putative Y-contig, manual searching of each contig was too demanding, thus opting for a more general investigation of potential contigs with Y-linked presence.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image6.png)
_Figure 3: Mummerplot of A: CANU-Full (Y-axis) and D. willistoni's Y contigs (X- axis), and B: NDN-Full (Y-axis) and D. willistoni's Y contigs (X-axis). Minimal alignment length was 5000 bp for both A and B. Red color indicates forward matches whereas blue instead signifies reverse matches._

In Figure 3, there are some contigs with many alignments to _D. willistoni_'s Y-linked contigs while other contigs are sparse. For CANU-Full (Figure 3A) especially, the number of dots are higher than for NDN-Full (Figure 3B), suggesting more Y chromosome presence than NDN-Full. In both Figure 3A and B, the majority of matches are reversed.

### 4.1.2 Differential coverage analysis

Depth of mapped female and mixed Illumina reads to the full genome assemblies were calculated over 10 kb-regions. Sum, average and median depth was calculated in each region. This was used to get a ratio between the average depths for female/mixed regions. Regions where female reads had not mapped resulted in a ratio of zero if the mixed reads had a depth of more than one. These are considered to indicate a Y chromosome region since the female reads are expected to not contain any male specific sequences.

The distribution of ratios was plotted and showed clear peaks on ratios of zero, around 0.9 and around 1.25 for NDN-Full (Figure 4A) and 0, 1 and 1.3 for CANU-Full (Figure 4B) representing putative Y chromosome regions, autosomal regions and X chromosomal regions respectively. This is a strong indication that there are contigs in both assemblies with Y chromosome origin.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image11.png)_Figure 4: The average depth ratio between female and mixed illumina reads in 10 kb regions of the genome. Note that the Y axis is on a different scale in A and B, making the occurrences not directly comparable. The peaks at 0.0, 0.9 and 1.25 in_ A _and at 0, 1 and 1.3 in_ B _correspond to regions likely to be found in the Y chromosome, the autosomes and the X chromosome respectively._

The contigs with a Female/Mixed depth ratio of 0 were extracted into a list of putative Y-contigs (data/putative\_contigs\_NDN-Full.csv, data/putative\_contigs\_CANU-Full.csv). From NDN-Full 49 contigs with a total length of 20.7 Mb were extracted. The 111 800 nanopore reads that mapped to these contigs and were extracted for Y-specific assembly had a total length of 1.6 Gb (Table 2: NDN-PY contigs). 152 putative Y contigs were extracted from CANU-Full, with a total length of 15.2 Mb. From these contigs 23 023 Nanopore reads with a total length of 345 Mb were extracted (Table 2: CANU-PY reads and CANU-PY contigs).

The sum of read depth in each 10 kb region (Figure 5) shows that there were more regions where female reads did not map compared to the mixed reads. The regions with no mapped reads from either sample are likely genomic areas that Illumina technology generally can not sequence while the regions where some mixed reads and no female reads mapped are putative Y regions. These regions occurred more often in CANU-Full (257 times, data/read\_depth\_CANU-Full.txt) than NDN-Full (178 times, data/read\_depth\_NDN-Full.txt), indicating more Y-regions in CANU-Full. There's also several peaks at higher coverage (Figure 5); In NDN-Full the mixed reads had a peak of occurrences of regions with an average coverage of 3000 and 6000 while the female reads showed a peak of occurrences of 10 kb regions with slightly under 6000 in coverage. In CANU-Full the higher coverage peaked at slightly below 6000 and 8000 for the mixed sample and slightly below 8000 for the female sample.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image8.png)
_Figure 5: The sum of coverage for both Female and Mixed illumina reads mapped to the different assemblies in 10 kb regions. Note that A and B have different scales on both the Y and X axis. A: NDN-Full showing peaks at 0 and less than 6000 for the female samples and 0, 3000, and less than 6000 for the mixed samples. B: In CANU-Full the female reads showed many occurrences at 0 coverage and slightly below 8000 coverage, while the mixed reads showed peaks at 0, slightly under 6000 and slightly under 8000. The female occurrences at 0 coverage is likely higher in both assemblies because the female reads did not map to Y chromosome regions._

## 4.2 Assembling the Y chromosome

From the evaluation of the two O11 assemblies, the whole genome alignments for NDN-Full did at most indicate a scattered Y chromosome throughout the assembly. Also, the result from the gene fishing (Section 10.1) only found one Y-specific gene in NDN-Full, even though six out of seven genes were found in CANU-Full. On the other hand, this was to various extent where the lowest hit had alignments only representing around 5% of the gene length. Also, using all the Y-linked genes, two expected novel _D. willistoni_ genes, _GK21041/CG18155_ and _GK20609/CG15580_, were found in NDN-Full and the first one of those was also found in CANU-Full. Unexpected genes were found in various amounts both in NDN-Full and CANU-Full. In summary, the result pointed towards the fact that the Y chromosomes could possibly be better assembled. Therefore, the project proceeded with the second goal to identify putative Y-contigs and assemble those.

The contigs selected using DCA (putative\_contigs.csv)can be seen in Table S1 along with the mean depth and standard deviation for each contigs from mapping of Nanopore reads. Table 2 shows data of the provided assemblies and the generated assemblies with best results. Data of the other generated assemblies, which were for investigating if they would give a more complete Y chromosome, can be found in Table S2.

_Table 2. Some statistics of both different sets of contigs, extracted reads and assemblies. The first section includes data sets related to NDN-Full, while the other section includes data sets from CANU-Full. ER are extracted Nanopore reads that were aligned to the corresponding putative Y contigs. The rows marked in blue are assemblies._

| **Data type** | **Nr of contigs** | **Nr of extracted reads** | **Tot. length (bp)** | **N50** | **Longest fragment (bp)** |
| --- | --- | --- | --- | --- | --- |
| **Provided O11 NextDenovo assembly (NDN-Full)** |
| NDN-Full | 111 | - | 231 322 445 | 18 682 906 | 33 685 207 |
| NDN-PY contigs | 49 | - | 20 719 315 | 13 031 326 | 13 031 326 |
| NDN-PY reads (ER) | - | 111 800 | 1 636 065 109 | 21 923 | 174 779 |
| NDN-FLYE-DCA | 354 | - | 31 191 470 | 260 102 | 5 436 810 |
| **Provided O11 Canu assembly (CANU-Full)** |
| CANU-Full | 778 | - | 290 618 187 | 13 377 261 | 37 833 592 |
| CANU-PY contigs | 152 | - | 15 164 172 | 109 199 | 377 480 |
| CANU-PY reads (ER) | - | 23 023 | 345 850 885 | 22 850 | 112 664 |
| CANU-FLYE-DCA | 469 | - | 25 332 753 | 94 777 | 525 870 |

## 4.3 Evaluation of NDN-FLYE-DCA and CANU-FLYE-DCA

In order to evaluate the two generated assemblies, several steps were conducted. First, an alignment against _D. willistoni_'s putative Y contigs were executed for both assemblies separately.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image7.png)
_Figure 6: Mummerplot of A: NDN-FLYE-DCA (Y-axis) against D. willistoni's Y contigs B: CANU-FLYE-DCA (Y-axis) against D. willistoni's Y contigs. Both plots are filtered with a minimum alignment length of 6000 bp._ Red color indicates forward matches whereas blue instead signifies reverse matches.

For CANU-FLYE-DCA we see a better alignment than for NDN-FLYE-DCA (Figure 6A and B). Mummer is unable to find a diagonal line for NDN-FLYE-DCA; sporadic patterns are, however, found on both Figure 6A and B.

Furthermore, the contig lengths of both NDN-FLYE-DCA and CANU-FLYE-DCA were compared to NDN-PY and CANU-PY respectively.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image2.png)
_Figure 7: Plot A: Contig length histogram of NDN-FLYE-DCA and NDN-PY with a logarithmic Y-axis. Plot B: Contig lengths and coverage of NDN-FLYE-DCA_

In the length analysis for NDN-FLYE-DCA, there is a slight improvement in contiguity (Figure 7A). Although NDN-PY has one much longer contig, which the flye assembler was unable to merge in NDN-FLYE-DCA. NDN-FLYE-DCA shows an increase in smaller contigs. In Figure 7B, a higher coverage for the 4 longest contigs than the rest and then follows a relatively evenly distributed low coverage.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image5.png)
_Figure 8: Plot A: Contig length histogram of CANU-FLYE-DCA and NDN-PY with a logarithmic Y-axis. Plot B: Contig lengths and coverage of CANU-FLYE-DCA_

When comparing CANU-FLYE-DCA and CANU-PY, we can observe three longer contigs in CANU-FLYE-DCA than the longest contig in CANU-PY (Figure 8). Following the same pattern as previously, CANU-FLYE-DCA exhibits an increase in shorter contigs. In Figure 8B, CANU-FLYE-DCA has an even distribution of coverage throughout the contigs, independent of length.

If only the contigs with a coverage above 20 of the two assemblies are inspected, the NDN-FLYE-DCA has 299 contigs with a length of 28 948 572 bp which is about five sixths of all contigs. Compared to CANU-FLYE-DCA with 165 contigs with a length of 8 512 852 bp which is only one third of all contigs.

### 4.3.1 RNA expression analysis

Lastly, to gain further insight of the presence of Y-linked genes in the assembly, a RNA expression analysis of abdomen data for both Female and Male were performed. The average read depth was calculated for windows of 1000 bp for both samples, then the difference of the depth was plotted. Interestingly, there appears to be a higher male-specific expression in NDN-FLYE-DCA compared to CANU-FLYE-DCA (Figure 9A and 9B). CANU-FLYE-DCA exhibits 2 peaks with differences larger than 0.15, whereas NDN-FLYE-DCA instead shows 6 peaks.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image12.png)
_Figure 9: The plots are presenting Male and Female differences in RNA expression, A: NDN-FLYE-DCA, B: CANU-FLYE-DCA._

## 4.4 Presence of known Y-linked genes

The result from all performed gene fishing procedures, of both provided and generated assemblies, with both the general Y-linked genes using tblastx and blastn followed by filtering as well as Y-specific genes using blastn can be found in Section 10.1. This includes gene fishing using BLAST of the provided assemblies and gene fishing using BLAST of all assemblies performed on the putative Y-contigs.

Using coding sequences of seven Y-specific genes only _ARY_ was found in NDN-Full, while all genes except CCY were found in CANU-Full, as previously described. No hits were found in NDN-FLYE-DCA while the genes _kl-2_, _ORY_, _CCY_ and _ARY_ were found in CANU-FLYE-DCA (Rows 6-17 in spreadsheet in Section 10.1). The percentage of how much of the gene length is covered varies between 4,9% (likely spurious) to 67% if we include all alignments, and 11% to 67% when only counting the best alignment for each gene.

Furthermore, using all Y-linked genes just as for the NDN-Full and CANU-Full, unexpected genes were found in various amounts in both NDN-FLYE-DCA and CANU-FLYE-DCA. Only _GK18510/ProtA_ got hits in both the provided assemblies and Flye assemblies. This gene has previously not been found on the _D. paulistorum_ Y chromosome and had been suggested to be a recent Y acquisition in _D. willistoni_ [(Ricchio](https://www.zotero.org/google-docs/?rE8Tdm)[_et al._](https://www.zotero.org/google-docs/?rE8Tdm)[2021)](https://www.zotero.org/google-docs/?rE8Tdm). The two expected novel _D. willistoni_ genes, _GK21041/CG18155_ and _GK20609/CG15580_, that were both found in NDN-Full and one found in CANU-Full, got no hits in the Flye assemblies.

For the other constructed assemblies that were tried out, the gene fishing of Y-specific genes turned out very similar for the Canu cases. While for the NDN with increased threshold for the differential coverage analysis, there were quite many more hits of Y-specific genes compared to the other NDN Flye assemblies.

## 4.5 Summary of results

Genome alignment showed a fragmented Y chromosome in both NDN-Full and CANU-Full, with CANU-Full exhibiting a slightly larger Y chromosome presence. By conducting a differential coverage analysis for both CANU-Full and CANU-PY, assemblies were generated of the resulting contigs and especially CANU-FLYE-DCA show increased contiguity compared to CANU-PY. In regards to gene content, there were a greater amount of Y-specific genes in the CANU-Full compared to NDN-Full, which was also the case for their FLYE-DCA assemblies. Figure 10 shows that the vast majority of the contigs found from DCA and gene fishing were not shared. The consensus of these methods points to CANU-FLYE-DCA being the most complete assembly with regards to Y chromosome content and contiguity, while still missing important known Y-specific genes.

![](https://github.com/kbylander/Finding-and-assembling-the-Y-chromosome-of-Drosophila-paulistorum/blob/master/data/image3.png)
_Figure 10. Venn diagram of the contigs found in NDN-Full (A) and CANU-Full (B) with DCA and the contigs with hits in gene fishing. The two shared contigs for NDN are ctg000- 300 and 410, and for Canu the seven contigs are tig00000- 208, 224, 310, 461, 585, 597 and 893._

## **5 Discussion**

Despite new strides in sequencing technology, assembling the Y chromosome without a reference proved to still be a significant challenge in most regards. Selecting a reference assembly, finding putative Y reads and evaluating Y presence all had unique problems that needed to be solved. Still, we have discovered important findings on how to evaluate, extract and assemble the Y chromosome in a _de novo_ genome assembly.

## 5.1 The presence of the Y chromosome in the provided assemblies

Evaluating the presence of the Y chromosome of the NDN-Full proved to be tricky. As can be seen in Table 1, only a few notable alignments were found on a large set of Y-linked scaffolds of _D. melanogaster_. _D. melanogaster_ is, however, a distant relative and Y chromosome assembly is often fragmented. Worth noting is that no contigs in Table 1 are found on the Y-putative contigs acquired from the differential coverage analysis. A possible explanation is the alignment of autosomal orthologs on _D. paulistorum_ to the Y-linked genes of _D. melanogaster_. The presence of the Y chromosome on CANU-Full was not investigated via IGV. On Figure 3, more alignments are observed for CANU-Full (Figure 3A) than for NDN-Full (Figure 3B), which coincides with an increase of BLAST findings (Section 10.1 Gene BLAST). The sporadic nature of both mummerplots in Figure 3 reveals the fragmented and repeat-rich nature of the Y chromosome and it is important to consider that many of the alignments might be repetitive elements or _D. willistoni_ Y-linked genes found in the autosomes or X chromosome of _D. paulistorum._

The DCA analysis found many putative Y contigs in both NDN-Full and CANU-Full (Table 2). When looking at the difference of 10 kb regions with zero female reads and 10 kb regions with zero mixed reads the number was higher in CANU-Full than NDN-Full (Figure 5), meaning more PY-regions in CANU-Full. There were also more PY contigs extracted from CANU-Full, but the total length was less than the total length of PY contigs extracted from NDN-Full. This is likely caused by NDN-Full having better contiguity, but also suggests that it might have been better to construct a method that uses the 10 kb regions to extract reads from instead of the contigs, since the contigs in both full assemblies could have been resolved with autosomal reads as well.

This difference in how much is extracted from the two provided assemblies is even more drastic when looking at the extracted reads from each PY contig list. There are 111 800 NDN-PY reads, while only 23 023 CANU-PY reads and the total length differs by over 1 Gb. Despite this vast difference the resulting FLYE-DCA assemblies sizes are less than 10 Mb apart, suggesting a Y chromosome size somewhere around 30 Mb long. It would have been interesting to use fastq format, instead of fasta, for the extracted reads in order to get information about the quality. This could give another dimension both of how well the extraction method works and it could also open possibilities to use alternative methods. The current DCA method is more sensitive and likely to catch more Y as well as autosomal/X reads, while a region-based extraction would be more specific with a higher risk of excluding true Y reads. Ultimately, it is very important to adapt the extraction and assembly methods to the purpose of the final Y assembly.

Previous work with _D. melanogaster_ also used DCA to extract PY reads for assembly, but they had a well annotated reference genome as well as both female only and male only reads, and decades of previous studies with other methods on the Y chromosome structure, to add to and support their final Y assemblies [(Chang & Larracuente 2019)](https://www.zotero.org/google-docs/?ySyX3r).

We see indications that our adapted method works with a _de novo_ assembly without annotation and with female reads and mixed sex reads instead. Our method is simpler and more broadly applicable since it does not rely on a reference genome, which is necessary since good reference genomes are rarely available for non-model species. This will of course result in a less complete assembly, as is often the case in new areas, but we believe it is a good step in making better _de novo_ assemblies of the Y chromosome possible. For further research, investigating the difference in using male-only reads instead of mixed reads would be an interesting next step.

## 5.2 Is reassembling contigs from Differential Coverage Analysis worth it?

The initial step of analysing CANU-FLYE-DCA and NDN-FLYE-DCA was a contig length analysis. For the two newly produced assemblies, an increase in both the number of contigs and assembly length was acquired (Table 2) and the majority of contigs are quite short (Figure 7A and 8A), likely due to either long regions of repeats breaking the contiguity or low coverage of these regions leaving the assembler incapable of linking the shorter contigs.

Furthermore, the contiguity of both NDN-FLYE-DCA and especially CANU-FLYE-DCA appear to be improved (Figure 7A and 8A) with latter having three longer contigs than the longest contig of CANU-PY (Figure 8A). The coverage distribution of the two flye assemblies are slightly different, with CANU-FLYE-DCA having a more evenly distributed coverage throughout the contig lengths (Figure 8B) whereas NDN-FLYE-DCA exhibits a higher coverage for the longer contigs (Figure 7B), which points to the longer contigs containing autosomal or X chromosome material. This is supported by the relatively low amounts of alignments for the longest contigs in Figure 6A.

Evidence suggests that a better alignment was acquired for CANU-FLYE-DCA (Figure 6B) against _D. willistoni_'s Y putative contigs, compared to NDN-FLYE-DCA (Figure 6A). This is likely a result of CANU-Full containing a larger presence of Y chromosome material than NDN-Full (Figure 3, 4 and 5) and as a consequence, more Y-linked reads are selected in the differential coverage analysis. Important to note is the uncertainty of to what degree the Y chromosomes of _D. paulistorum_ and _D. willistoni_ would align in an ideal case, due to the degrading nature of the Y chromosome, a perfect alignment is certainly not expected.

## 5.3 Additional read extractions results in large Y assemblies

There were a couple of different types of assemblies produced with Flye, these were for NDN with the DCA and some interesting gene fishing contigs in addition as well as another one with an increased threshold for the differential coverage analysis. For the lastly mentioned there were a lot more hits with the gene fishing compared to the other NDN assemblies which is interesting. This could indicate that some valuable contigs were included, but on the other hand some of the hits were quite short alignments which could indicate that they are not actual hits. For Canu there was one assembly with the threshold for the read depth set to 0 for the mixed samples instead of 1, and one with some interesting gene fishing contigs added. Both of these got similar hits during gene fishing compared to the regular Flye assembly produced. For all these four cases though, the total length of the assembly ended up very long as can be seen in Table S2. For three cases it is around half of the total length of the provided assembly, and for one case even longer, which does not seem to be a reasonable result. This suggests that there are either a lot more than only the Y chromosome included or that the assemblers could not solve for example repeats well enough.

## 5.4 Presence of Y-specific genes and Y-linked genes

The BLAST for Y-specific genes showed that many more known Y-specific genes were present in CANU-Full than NDN-Full, and that this significantly affected what was extracted and assembled in the Y chromosome assemblies. NDN-Full had much better quality in regards to contiguity and completeness for the overall genome and had been polished, while CANU-Full was worse in all the standard QC measurements and had not been polished. This suggests that there is a trade-off between overall genome assembly quality and Y chromosome assembly quality with currently available methods, which supports a separation of autosome and X chromosome assembly from Y chromosome assembly.

Out of the seven Y-specific genes that were BLAST:ed towards all assemblies, six were found in CANU-Full and four were found in CANU-FLYE-DCA. Interestingly, this was not only a decrease because the gene that was not found in CANU-Full, CCY, was found in CANU-FLYE-DCA. It is possible that the extraction of putative Y reads for assembly led to more low coverage regions being resolved, which made alignment with CCY possible. These results also give support for the DCA leading to extraction of actual Y-reads, by combining regions with low/no female coverage and Y-specific gene presence.

The general Y-linked genes have previously been documented as autosomal copies, which makes any alignment, especially in the full assemblies, questionable with regards to support of Y chromosome identity. Additionally, the sequences we used for BLAST:ing contain introns, which makes spurious alignments more likely. Filtering for alignments of at least 60% of the gene length removed most hits in all assemblies, and using tblastx and the same gene length filter divided by three found no hits in NDN-FLYE-DCA, CANU-Full and CANU-FLYE-DCA. This makes the few hits found in NDN-Full very likely to be autosomal genes.

## 5.5 Can transcriptomics aid in the evaluation of the assemblies?

To further analyse the Y-linked gene presence in the two assemblies, a transcriptomics analysis was performed. Assuming there is testis expression in the male data, there should be regions with higher male than female RNA coverage, which is observed when comparing Figure 9A and B. Although, drawing any major conclusion from this data is difficult. The star tool is likely to find many false positives, since it uses Y assemblies reference genome and not the whole genomes.

Evidence of the mapping behaving suspect can be observed in Figure S1 where both male and female have regions with high read coverage for NDN-FLYE-DCA, compared to CANU-FLYE-DCA (Figure S2) where few regions of both male and female have high read depth. This indicates Autosomal or X chromosome presence in the NDN-FLYE-DCA assembly, as previously suggested in 5.2. A step to increase the precision of the results, removing the putative Y contigs in CANU-Full and NDN-Full and inserting CANU-FLYE-DCA and NDN-FLYE-DCA respectively would possibly remove a proportion of reads mapping to the current reference sequences. This might result in a higher precision, and hopefully, better differentiation between the male and female samples.

In the ideal case, CANU-FLYE-DCA and NDN-FLYE-DCA would be perfect assemblies of _D. paulistorum_ O11's Y chromosome and any female expression data mapped to the assemblies would be Y-linked genes with an autosomal or X-linked copy. However, in _Drosophila_, most autosomal and X-copies of the Y-linked gene are degraded [(Ricchio](https://www.zotero.org/google-docs/?en9MMu)[_et al._](https://www.zotero.org/google-docs/?en9MMu)[2021)](https://www.zotero.org/google-docs/?en9MMu) leading to most genes being Y-specific hence, male and female expression should not be similar and large male specific peaks are expected. In our data, no true male specific peaks are observed on either NDN-FLYE-DCA (Figure 9A) or CANU-FLYE-DCA (Figure 9B), meaning no differences are reaching the maximum value of 1.

## **6 Conclusion**

In summary, we can conclude that a better overall assembly does not necessarily mean that the Y chromosome is more complete. It would rather decrease the Y-specific content in the final assembly which was seen both when comparing the two provided NextDenovo and Canu assemblies by searching for Y-linked and Y-specific genes, as well as in the DCA analysis which showed more 10 kb regions with mapped mixed reads and no mapped female reads. We also found that Y-specific long read content can be selected and thereafter used for creating specific Y-assemblies with short read DCA. This improves contiguity, but more contigs are generated and some of the previously identified Y-specific genes disappear. The genes _kl-2, ORY, CCY_ and _ARY_ have the highest support as Y-specific since they were identified with both DCA and gene fishing with BLAST. Even though the project has improved the assembled Y chromosome, more research into Y-specific assembly is necessary since the gene content could be improved and other assemblers need to be examined. Perhaps we are now one step closer to finding out how the Y chromosome in _D. paulistorum_ affects speciation.

## **7 Group member contributions**

During the project work KB mainly worked on and was responsible for RNA transcriptomics and genome alignments. JH was responsible for DNA read mapping and differential coverage analysis. Finally, ES was responsible for working with the gene fishing, extraction of putative Y reads as well as generating the assemblies. Each author has contributed to all parts of the report with writing and input, with a focus on writing the parts they mainly were responsible for. All of the authors contributed equally to both the report, project work and interpretation of results.

## **8 Acknowledgement**

Computations and storage were on UPPMAX, Uppsala Multidisciplinary Center for Advanced Computational Science with projects SNIC 2022/22-721 and SNIC 2022/23-571 (De novo assembly and annotation of _D. paulistorum_ and other willistoni group species).

The authors would like to thank our clients at ICM (Department of Cell and Molecular Biology), Mercé Montoliu Nerín and Lisa Klasson, for the advice and support as well as the provided data used in the project. Additionally, thanks to our supervisor Douglas Scofield for both the support during the project and for his comments on improvements to the report.

## **9 References**

[Baião GC, Schneider DI, Miller WJ, Klasson L. 2019. The effect of Wolbachia on gene expression in Drosophila paulistorum and its implications for symbiont-induced host speciation. BMC Genomics 20: 465.](https://www.zotero.org/google-docs/?zofhWW)

[Camacho C, Coulouris G, Avagyan V, Ma N, Papadopoulos J, Bealer K, Madden TL. 2009. BLAST+: architecture and applications. BMC Bioinformatics 10: 421.](https://www.zotero.org/google-docs/?zofhWW)

[Chang C-H, Larracuente AM. 2019. Heterochromatin-Enriched Assemblies Reveal the Sequence and Organization of the](https://www.zotero.org/google-docs/?zofhWW)[_Drosophila melanogaster_](https://www.zotero.org/google-docs/?zofhWW)[Y Chromosome. Genetics 211: 333–348.](https://www.zotero.org/google-docs/?zofhWW)

[Danecek P, Bonfield JK, Liddle J, Marshall J, Ohan V, Pollard MO, Whitwham A, Keane T, McCarthy SA, Davies RM, Li H. 2021. Twelve years of SAMtools and BCFtools. GigaScience 10: giab008.](https://www.zotero.org/google-docs/?zofhWW)

[Dobin A, Davis CA, Schlesinger F, Drenkow J, Zaleski C, Jha S, Batut P, Chaisson M, Gingeras TR. 2013. STAR: ultrafast universal RNA-seq aligner. Bioinformatics 29: 15–21.](https://www.zotero.org/google-docs/?zofhWW)

[Dobzhansky T, Spassky B. 1959. Drosophila paulistorum, a cluster of species in statu nascendi\*†. Proceedings of the National Academy of Sciences 45: 419–428.](https://www.zotero.org/google-docs/?zofhWW)

[Finet C, Kassner VA, Carvalho AB, Chung H, Day JP, Day S, Delaney EK, De Ré FC, Dufour HD, Dupim E, Izumitani HF, Gautério TB, Justen J, Katoh T, Kopp A, Koshikawa S, Longdon B, Loreto EL, Nunes MDS, Raja KKB, Rebeiz M, Ritchie MG, Saakyan G, Sneddon T, Teramoto M, Tyukmaeva V, Vanderlinde T, Wey EE, Werner T, Williams TM, Robe LJ, Toda MJ, Marlétaz F. 2021. DrosoPhyla: Resources for Drosophilid Phylogeny and Systematics. Genome Biology and Evolution 13: evab179.](https://www.zotero.org/google-docs/?zofhWW)

[Furman BLS, Metzger DCH, Darolti I, Wright AE, Sandkam BA, Almeida P, Shu JJ, Mank JE. 2020. Sex Chromosome Evolution: So Many Exceptions to the Rules. Genome Biology and Evolution 12: 750–763.](https://www.zotero.org/google-docs/?zofhWW)

[Hjelmen CE, Blackmon H, Holmes VR, Burrus CG, Johnston JS. 2019a. Genome Size Evolution Differs Between Drosophila Subgenera with Striking Differences in Male and Female Genome Size in Sophophora. G3 (Bethesda, Md) 9: 3167–3179.](https://www.zotero.org/google-docs/?zofhWW)

[Hjelmen CE, Garrett MA, Holmes VR, Mynes M, Piron E, Johnston JS. 2019b. Genome Size Evolution within and between the Sexes. The Journal of Heredity 110: 219–228.](https://www.zotero.org/google-docs/?zofhWW)

[Hughes JF, Rozen S. 2012. Genomics and Genetics of Human and Primate Y Chromosomes. Annual Review of Genomics and Human Genetics 13: 83–108.](https://www.zotero.org/google-docs/?zofhWW)

[Kolmogorov M, Yuan J, Lin Y, Pevzner PA. 2019. Assembly of long, error-prone reads using repeat graphs. Nature Biotechnology 37: 540–546.](https://www.zotero.org/google-docs/?zofhWW)

[Koren S, Walenz BP, Berlin K, Miller JR, Bergman NH, Phillippy AM. 2017. Canu: scalable and accurate long-read assembly via adaptive](https://www.zotero.org/google-docs/?zofhWW)[_k_](https://www.zotero.org/google-docs/?zofhWW)[-mer weighting and repeat separation. Genome Research 27: 722–736.](https://www.zotero.org/google-docs/?zofhWW)

[Lenormand T, Roze D. 2022. Y recombination arrest and degeneration in the absence of sexual dimorphism. Science, doi 10.1126/science.abj1813.](https://www.zotero.org/google-docs/?zofhWW)

[Li H. 2018. Minimap2: pairwise alignment for nucleotide sequences. Bioinformatics 34: 3094–3100.](https://www.zotero.org/google-docs/?zofhWW)

[Marsano RM, Giordano E, Messina G, Dimitri P. 2019. A New Portrait of Constitutive Heterochromatin: Lessons from Drosophila melanogaster. Trends in Genetics 35: 615–631.](https://www.zotero.org/google-docs/?zofhWW)

[Massey JH, Wittkopp PJ. 2016. Chapter Two - The Genetic Basis of Pigmentation Differences Within and Between Drosophila Species. I: Orgogozo V (red.). Current Topics in Developmental Biology, s. 27–61. Academic Press,](https://www.zotero.org/google-docs/?zofhWW)

[NextOmics. 2019. NextDenovo.](https://www.zotero.org/google-docs/?zofhWW)

[Ricchio J, Uno F, Carvalho AB. 2021. New Genes in the Drosophila Y Chromosome: Lessons from D. willistoni. Genes 12: 1815.](https://www.zotero.org/google-docs/?zofhWW)

[Robe LJ, Cordeiro J, Loreto ELS, Valente VLS. 2010. Taxonomic boundaries, phylogenetic relationships and biogeography of the Drosophila willistoni subgroup (Diptera: Drosophilidae). Genetica 138: 601–617.](https://www.zotero.org/google-docs/?zofhWW)

[Robinson JT, Thorvaldsdóttir H, Winckler W, Guttman M, Lander ES, Getz G, Mesirov JP. 2011. Integrative Genomics Viewer. Nature biotechnology 29: 24–26.](https://www.zotero.org/google-docs/?zofhWW)

[Salz H, Erickson JW. 2010. Sex determination in Drosophila: The view from the top. Fly 4: 60–70.](https://www.zotero.org/google-docs/?zofhWW)

[Sayers EW, Bolton EE, Brister JR, Canese K, Chan J, Comeau DC, Connor R, Funk K, Kelly C, Kim S, Madej T, Marchler-Bauer A, Lanczycki C, Lathrop S, Lu Z, Thibaud-Nissen F, Murphy T, Phan L, Skripchenko Y, Tse T, Wang J, Williams R, Trawick BW, Pruitt KD, Sherry ST. 2022. Database resources of the national center for biotechnology information. Nucleic Acids Research 50: D20–D26.](https://www.zotero.org/google-docs/?zofhWW)

[Wang SH, Nan R, Accardo MC, Sentmanat M, Dimitri P, Elgin SCR. 2014. A Distinct Type of Heterochromatin at the Telomeric Region of the Drosophila melanogaster Y Chromosome. PLOS ONE 9: e86451.](https://www.zotero.org/google-docs/?zofhWW)

[Zanini R, Deprá M, da Silva Valente VL. 2015. Can sibling species of the Drosophila willistoni subgroup be recognized through combined microscopy techniques? Revista Brasileira de Entomologia 59: 323–331.](https://www.zotero.org/google-docs/?zofhWW)

[Zanini R, Müller MJ, Vieira GC, Valiati VH, Deprá M, Valente VL da S. 2018. Combining morphology and molecular data to improve Drosophila paulistorum (Diptera, Drosophilidae) taxonomic status. Fly 12: 81–94.](https://www.zotero.org/google-docs/?zofhWW)

## 10 Appendix

## 10.1 Genes and result for evaluating presence of known Y-linked genes

The listed known Y-linked genes, as well as the result from the different kinds of searches of these genes.

[Gene BLAST](https://docs.google.com/spreadsheets/d/1qu66P6SE2cusboTKNJspPpi3Bco2ORWa5zVM6Kz6afo/edit#gid=1774667191)
