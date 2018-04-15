function [freqArray] = CommonSpamWords(email_contents,freq_threshold)
%PROCESSEMAIL preprocesses a the body of an email and
%returns a list of word_indices 
%   word_indices = PROCESSEMAIL(email_contents) preprocesses 
%   the body of an email and returns a list of indices of the 
%   words contained in the email. 
%

% Load Vocabulary
vocabList = getVocabList();

% Init return value
words= {};
freqArray=[];
index = {};

% ========================== Preprocess Email ===========================

% Find the Headers ( \n\n and remove )
% Uncomment the following lines if you are working with raw emails with the
% full headers

% hdrstart = strfind(email_contents, ([char(10) char(10)]));
% email_contents = email_contents(hdrstart(1):end);

% Lower case
email_contents = lower(email_contents);

% Strip all HTML
%All HTML tags are removed from the emails.
%Many emails often come with HTML formatting; we remove all the
%HTML tags, so that only the content remains.
email_contents = regexprep(email_contents, '<[^<>]+>', ' ');

% Handle Numbers
% All numbers are replaced with the text "number".
email_contents = regexprep(email_contents, '[0-9]+', 'number');

% Handle URLS
% All URLs are replaced with the text "httpaddr".
email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');

% Handle Email Addresses
% All email addresses are replaced with the text \emailaddr".
email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');

% Handle $ sign:ll dollar signs ($) are replaced with the text "dollar"
email_contents = regexprep(email_contents, '[$]+', 'dollar');


% ========================== Tokenize Email ===========================

% Process file
l = 0;

while ~isempty(email_contents)

    % Tokenize and also get rid of any punctuation
    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   
    % Remove any non alphanumeric characters
    %All white spaces (tabs, newlines, spaces) have all been trimmed to a single space character.
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    % Stem the word 
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try str = porterStemmer(strtrim(str)); 
    catch str = ''; continue;
    end

    % Skip the word if it is too short
    if length(str) < 1
       continue;
    end
    
    words{end+1} = str; 
  
%     % Print to screen, ensuring that the output lines are not too long
%     if (l + length(str) + 1) > 78
%         fprintf('\n');
%         l = 0;
%     end
%     fprintf('%s ', str);
%     l = l + length(str) + 1;

end

uniqueWords =unique(words,'stable');
frequency=cellfun(@(x) sum(ismember(words,x)),uniqueWords,'un',0);

for i = 1: size(uniqueWords,2)
    index{end+1} = i;
end
index = index';

freqArray = [uniqueWords;frequency];
freqArray=freqArray';
%sort the rows of matrix A by descending order of column 2: -2
% then sort the rows by ascending order of column 1:1
freqArray = sortrows(freqArray,[-2,1]);
freqArray = [index,freqArray];

for i = 1: size(uniqueWords,2)
    if freqArray{i,3} < freq_threshold
        freqArray{i,3}='delete';
    end
end

removeRowIndex = strcmp(freqArray(:,3),'delete');
freqArray(removeRowIndex,:) = [];


% Another way to delete certain cell array with special value:
% a={1200,'Unknown - State'
%    1700,    'Rest'
%    1600,    'Unknown - State'
%    2100,    'City'}
% b=a(~ismember(a(:,2),'Unknown - State'),:)

% % Print footer
% fprintf('\n\n=========================\n');

end



