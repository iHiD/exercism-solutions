export const toRna = (dna) => {
  return dna.replace(letterRegex, (nuc) => nucleotideComplements[nuc]);
};

const nucleotideComplements = {"G": "C", "C": "G", "T": "A", "A": "U"};
const letterRegex = /[A-Z]/g;
