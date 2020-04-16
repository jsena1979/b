DROP PROCEDURE IF EXISTS mnu_demo_proc;
DELIMITER go
CREATE PROCEDURE `mnu_demo_proc`()
BEGIN
  declare c1id,c2id,c3id int;
  declare c1name,c2name,c3name varchar(10);
  declare loop1ctr,loop2ctr,loop3ctr int default 0;
  declare not_found int default 0;
  declare c1 cursor for select id,nme from mnudemo;
  declare c2 cursor for select id,nme from mnudemo where pid=c1id;
  declare c3 cursor for select id,nme from mnudemo where pid=c2id;
  declare continue handler for not found set not_found:=1;
  open c1;
  loop1:loop
    SET loop1ctr:=loop1ctr+1;
    SELECT loop1ctr;
    fetch c1 into c1id,c1name;
    if not_found=1 then
      close c1;
      leave loop1;
    end if;
    open c2;
    loop2:loop
      SET loop2ctr:=loop2ctr+1; 
      SELECT loop2ctr; 
      fetch c2 into c2id,c2name;
      if not_found=1 then
        set not_found:=0;
       close c2;
       leave loop2;
      end if;
      open c3;
      loop3:loop
        SET loop3ctr:=loop3ctr+1;
        SELECT loop3ctr;
        fetch c3 into c3id,c3name;
        if not_found=1 then
          set not_found:=0;
          close c3;
          leave loop3;
        end if;
        select c1name as parent,c2name as child,c3name as subchild;
      end loop loop3;
    end loop loop2;
  end loop loop1;
END;
go
DELIMITER ;
call mnu_demo_proc();