function impactFactor = searchImpactFactor(issn)
% search impact factor with the ISSN of a journal at letpub.com

url = 'http://www.letpub.com.cn/index.php?page=journalapp&view=search';
options = weboptions('Timeout', 60);
source_page = webread(url, 'searchissn', issn, options);
pattern = '>[0-9]\.[0-9][0-9][0-9]';
impactFactor = regexp(source_page, pattern, 'match');
impactFactor = impactFactor{1};
impactFactor = impactFactor(2:end);
impactFactor = str2double(impactFactor);
