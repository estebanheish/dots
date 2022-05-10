#!/bin/bash
# Sed script for replacing accents for the equivalent groff-ms escaped characters.
{
s/á/\\*[\']a/g
s/Á/\\*[\']A/g
s/é/\\*[\']e/g
s/É/\\*[\']E/g
s/í/\\*[\']i/g
s/Í/\\*[\']I/g
s/ó/\\*[\']o/g
s/Ó/\\*[\']O/g
s/ú/\\*[\']u/g
s/Ú/\\*[\']U/g
}
