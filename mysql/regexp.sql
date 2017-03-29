#page 1,2 대소문자는 신경 안쓰지만, 띄어쓰기는 신경 쓴다. 
select 'Hello, world!' regexp 'hello,';
select 'Hello, world!' regexp 'hello, world';

#page 3 첫문자와 마지막 문자를 찾는다. 
select 'who is who' regexp '^who';
select 'who is who'  regexp 'who$';

#page 4 escape code \
select '$12$ \-\ $25$' regexp '\$';

#page 5,6 '.' matches with any characters 
select 'Regular expressions are powerful!!!' regexp '.';
select '   ' regexp '..........';

#page 7 []은 속에 있는 모든 문자를 검색한다. -을 쓰면 연속된 문자를 검색하나 한국어는 모아쓰기이기 때문에 필요 없다. 
select '"How do you do"'  regexp '["]';
select 'ㄱㄴㄷㄹ' regexp '[ㄱ-ㄹ]';
