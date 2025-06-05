import { toRna } from './rna-transcription'

describe('Transcription', () => {
  test('incorrect rna sequence', () => {
    expect(toRna('AACCGGTTXX')).toEqual('UUGGCCAAXX');
  });
})
