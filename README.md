# boohbahLab
Question One - 
- There is a error when grouping by boohbah_id, and there needs to be a subquery for the avg(sync_level). By making it a nested function and changing 'group by' to 'order by', it fulfills the original purpose. 
Question Two - 
- 
Question Three - 
- There is an invalid identifier error in the query. "boohbah_name" is not the correct column name, changing it to "name" works. 
Question Four - 
- The columns give an ambiguously defined error, and the jojo_stand table is not included in the query. By including it, and giving the ids b., s., they become more identifiable. 
Question Five - 
- This retrieves the correct information with no error, I couldn't find anything wrong with it. 
Question Six - 
- 
Question Seven - 
- Retrieved all stands instead of the stands that matched boohbah_id to stand_id. By adding an 'and boohbah_id = stand_id" we get the correct answer instead of every possible answer.
Question Eight - 
- There is a group function where there shouldn't be. By making it a nested query it is fixed. 
Question Nine - 
- 
Question Ten - 
