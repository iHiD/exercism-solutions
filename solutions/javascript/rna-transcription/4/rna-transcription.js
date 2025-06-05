export const toRna = (dna) => {
  return dna.replace(validLettersRegex, (nuc) => nucleotideComplements[nuc]);
};

const nucleotideComplements = {"G": "C", "C": "G", "T": "A", "A": "U"};
const validLettersRegex = /[GCTA]/g;
