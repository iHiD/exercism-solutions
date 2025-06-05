export const toRna = (dna) => {
  return dna.replace(/[A-Z]/g, (nuc) => nucleotideComplements[nuc])
};

const nucleotideComplements = {"G": "C", "C": "G", "T": "A", "A": "U"}
