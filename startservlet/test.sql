select * from board;
select * from member;
insert into board values((select max(idx)+1 from board), '트리거연습2','트리거연습2','kitri', sysdate,1111,50);
select count(*) from board;
select rownum, idx from board;
select head, ctx, mem from board where (ctx like '송%') or (mem like '송%') or (head like '송%');
select * from board where hit >= 50;

select b1.* from(select rownum r, b.* from(select * from board order by time desc) b)b1 where r>=1 and r<=5;

