function x = emailFeatures(word_indices)
%EMAILFEATURES takes in a word_indices vector and produces a feature vector
%from the word indices
%   x = EMAILFEATURES(word_indices) takes in a word_indices vector and 
%   produces a feature vector from the word indices. 
vocabList = getVocabList();
% Total number of words in the dictionary
n = length(vocabList)

% You need to return the following variables correctly.
x = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return a feature vector for the
%               given email (word_indices). To help make it easier to 
%               process the emails, we have have already pre-processed each
%               email and converted each word in the email into an index in
%               a fixed dictionary (of 1899 words). The variable
%               word_indices contains the list of indices of the words
%               which occur in one email.
%              Your task is take one such word_indices vector and construct
%              a binary feature vector that indicates whether a particular
%              word occurs in the email. That is, x(i) = 1 when word i
%              is present in the email. Concretely, if the word 'the' (say,
%              index 60) appears in the email, then x(60) = 1. The feature
%              vector should look like:You should see that the feature vec
               %tor had length 1899 and 45 non-zero entries.
%
%              x = [ 0 0 0 0 1 0 0 0 ... 0 0 0 0 1 ... 0 0 0 1 0 ..];
%
%
for i =1:length(word_indices)
    x(i)=1;
end 

% =========================================================================
    

end
