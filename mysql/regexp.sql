#page1 ,2 대소문자는 신경 안쓰지만, 띄어쓰기는 신경 쓴다. 
select 'Hello, world!' regexp 'hello,';
select 'Hello, world!' regexp 'hello, world';

#page3 첫문자와 마지막 문자를 찾는다. 
select 'who is who' regexp '^who';
select 'who is who'  regexp 'who$';

#page 4 escape code \
select '$12$ \-\ $25$' regexp '\$';

# '.' matches with any characters 
select 'Regular expressions are powerful!!!' regexp '.';
select '   ' regexp '..........';
